#!/usr/bin/env python
from shutil import copy, move
from re import findall, search, match, DOTALL, IGNORECASE
from zipfile import ZipFile
import os


LOCALE_LANG = {
    "Localization.en.lua": "en",
    "Localization.de.lua": "de",
    "Localization.fr.lua": "fr",
    "Localization.nl.lua": "nl",
    "Localization.es.lua": "es",
    "Localization.pt.lua": "pt",
}


class WQ_file_processor:
    def __init__(self):
        self.prefix = "murfy"
        self.root_path = "."
        self.block_separator = "--"
        self.block_head = '{   id = "'
        self.block_file = 'file = "'
        self.block_length = "len = "
        self.block_message = 'msg = "'
        self.block_tail = "cat = 1\n},\n"
        self.start_indicator = f"-- end of {self.prefix} media data"
        self.final = f"{self.start_indicator}\n"
        self.id_prefix = f"{self.prefix}:"
        self.file_prefix = f"{self.prefix}_"
        self.file_suffix = ".mp3"
        self.separator = ",\n    "
        self.next_id = 0
        self.upload_path = os.path.join(self.root_path, "Upload")
        self.addon_path = os.path.join(self.root_path, "WoWQuote2")
        self.media_path = os.path.join(self.addon_path, "media")
        self.lua_file = os.path.join(self.addon_path, "Media.lua")
        self.localization_files = [
            os.path.join(self.addon_path, "Localization.en.lua"),
            os.path.join(self.addon_path, "Localization.de.lua"),
            os.path.join(self.addon_path, "Localization.fr.lua"),
            os.path.join(self.addon_path, "Localization.nl.lua"),
            os.path.join(self.addon_path, "Localization.es.lua"),
            os.path.join(self.addon_path, "Localization.pt.lua"),
        ]
        self.localization_file = self.localization_files[0]
        self.toc_file = os.path.join(self.addon_path, "WoWQuote2.toc")
        self.ui_lua_file = os.path.join(self.addon_path, "WoWQuote2UI.lua")
        self.ui_xml_file = os.path.join(self.addon_path, "WoWQuote2UI.xml")
        self.extraction_path = os.path.join(self.root_path, "extracted")
        self.release_path = os.path.join(self.root_path, "Release")
        self.file_descriptor = os.path.join(self.extraction_path, "file_descriptor.txt")
        self.media_data_file = os.path.join(self.root_path, "media_data.lua")

        os.makedirs(self.release_path, exist_ok=True)
        os.makedirs(self.extraction_path, exist_ok=True)

        self.populate_from_media_data()
        self.extract_archives()
        self.create_release_archives(["TBC", "Vanilla", "WOTLK"])
        self.clear_generated_files()

    def _parse_categories(self, block: str) -> list[dict]:
        # Parse line by line to preserve order and handle both formats:
        #   plain string:  "Name",
        #   localized:     { en = "Name", de = "Übersetzung", ... },
        categories = []
        for line in block.splitlines():
            line = line.strip()
            if line.startswith("{"):
                cat = {}
                for lang, name in findall(r'(\w+)\s*=\s*"([^"]+)"', line):
                    cat[lang] = name
                if cat:
                    categories.append(cat)
            elif line.startswith('"'):
                name_match = search(r'"([^"]+)"', line)
                if name_match:
                    categories.append({"en": name_match.group(1)})
        return categories

    def populate_from_media_data(self) -> None:
        if not os.path.exists(self.media_data_file):
            print(f"Warning: {self.media_data_file} not found, Media.lua will be empty")
            return

        with open(self.media_data_file, "r") as f:
            data = f.read()

        # Extract WQmedia_data inner content
        media_match = search(r"WQmedia_data\s*=\s*\{(.*?)\};", data, DOTALL)
        if media_match:
            with open(self.lua_file, "w") as f:
                f.write("WQmedia = {\n")
                f.write(media_match.group(1))
                f.write("};\n")

        # Extract WQcategories_data entries and write to all locale files.
        # Supports both plain string entries ("Name") and localized table entries
        # ({ en = "Name", de = "Übersetzung", ... }). Plain strings are treated as
        # the English/canonical name with no locale-specific overrides.
        cat_match = search(r"WQcategories_data\s*=\s*\{(.*?)\};", data, DOTALL)
        if cat_match:
            categories = self._parse_categories(cat_match.group(1))
            for loc_file in self.localization_files:
                lang = LOCALE_LANG.get(os.path.basename(loc_file), "en")
                translated = "\n" + "".join(
                    f'    "{cat.get(lang, cat["en"])}",\n' for cat in categories
                )
                with open(loc_file, "r") as f:
                    loc_data = f.read()
                filled = loc_data.replace(
                    "WQcategories = {\n-- generated at build time\n};",
                    f"WQcategories = {{{translated}}};"
                )
                with open(loc_file, "w") as f:
                    f.write(filled)

    def clear_generated_files(self) -> None:
        with open(self.lua_file, "w") as f:
            f.write("WQmedia = {\n-- generated at build time\n};\n")
        for loc_file in self.localization_files:
            with open(loc_file, "r") as f:
                loc_data = f.read()
            cleared = search(r"WQcategories\s*=\s*\{.*?\};", loc_data, DOTALL)
            if cleared:
                new_loc = loc_data[:cleared.start()] + "WQcategories = {\n-- generated at build time\n};" + loc_data[cleared.end():]
                with open(loc_file, "w") as f:
                    f.write(new_loc)

    def create_release_archives(self, versions: list[str]) -> None:
        old_file_list = os.listdir(self.release_path)
        for old_file in old_file_list:
            os.remove(os.path.join(self.release_path, old_file))

        for version in versions:
            self.release_name = f"WQ2-{version}-{self.read_toc_version(version)}.zip"
            self.clear_release_specific_files()
            self.copy_release_specific_files(version)
            self.create_release_archive()

        self.clear_release_specific_files()

    def create_release_archive(self) -> None:
        with ZipFile(os.path.join(self.release_path, self.release_name), "w") as zip:
            for dirname, _, files in os.walk(self.addon_path):
                arcdir = os.path.relpath(dirname, self.root_path)
                zip.write(dirname, arcdir)
                for input_file in files:
                    file_path = os.path.join(dirname, input_file)
                    zip.write(file_path, os.path.join(arcdir, input_file))

    def clear_release_specific_files(self) -> None:
        try:
            os.remove(self.toc_file)
            os.remove(self.ui_lua_file)
            os.remove(self.ui_xml_file)
        except FileNotFoundError:
            pass

    def read_toc_version(self, version: str) -> str:
        """Read `## Version:` from a client variant's .toc.

        Archives are named after the addon version rather than the build date so
        the filename matches the release tag, which CI derives from the same
        field. Dated names could not do that: two releases on one day collided,
        and a version bump left the old date in the filename.

        Each variant is read separately rather than assuming they agree, so a
        .toc left un-bumped produces a visibly mismatched archive instead of one
        silently mislabelled with another variant's version.
        """
        toc_path = os.path.join(self.root_path, version, "WoWQuote2.toc")
        with open(toc_path) as f:
            for line in f:
                found = match(r"^##\s*Version:\s*(\S+)", line, IGNORECASE)
                if found:
                    return found.group(1)
        raise ValueError(f"no '## Version:' field in {toc_path}")

    def copy_release_specific_files(self, version: str) -> None:
        version_path = os.path.join(self.root_path, version)
        for file in os.listdir(version_path):
            copy(os.path.join(version_path, file), os.path.join(self.addon_path, file))

    def find_zip_files(self) -> list[str]:
        zip_paths: list[str] = []
        for file in os.listdir(self.upload_path):
            if file.endswith(".zip"):
                zip_paths.append(os.path.join(self.upload_path, file))
        return zip_paths

    def extract_archives(self) -> None:
        zip_paths = self.find_zip_files()
        if not zip_paths:
            return
        for zip_path in zip_paths:
            with ZipFile(zip_path, "r") as zip:
                zip.extractall(self.extraction_path)
            os.remove(zip_path)
            self.parse_descriptor()

    def move_file(self, file_name: str, new_file_name: str) -> None:
        old_path = os.path.join(self.extraction_path, file_name)
        new_path = os.path.join(self.media_path, new_file_name)
        move(old_path, new_path)

    def get_next_id(self, lua_data: list[str]) -> None:
        replacement_index = 0
        for index, line in enumerate(lua_data):
            if line.startswith(self.start_indicator):
                replacement_index = index
        if replacement_index != 0:
            id_line = lua_data[replacement_index - 6]
            current_id = int(findall(r"\d+", id_line)[0]) + 1
            self.next_id = "0" + str(current_id)

    def build_block(self, file_name: str, length: str, message: str) -> str:
        if file_name == "" or length == "" or message == "":
            print("invalid block detected, discarding")
        else:
            new_id = self.id_prefix + self.next_id
            new_file_name = self.file_prefix + self.next_id + self.file_suffix
            self.move_file(file_name, new_file_name)
            return (
                self.block_head
                + new_id
                + '"'
                + self.separator
                + self.block_file
                + new_file_name
                + '"'
                + self.separator
                + self.block_length
                + length
                + self.separator
                + self.block_message
                + message
                + '"'
                + self.separator
                + self.block_tail
            )

    def write_blocks(self, blocks: list[str]) -> None:
        lua_data = []
        block_string = "".join(blocks)
        with open(self.media_data_file, "r") as f:
            lua_data = f.readlines()
            replacement_index = 0
            for index, line in enumerate(lua_data):
                if line.startswith(self.start_indicator):
                    replacement_index = index
        if replacement_index != 0:
            lua_data[replacement_index] = block_string
            with open(self.media_data_file, "w") as f:
                f.writelines(lua_data)

    def parse_descriptor(self) -> None:
        with open(self.media_data_file, "r") as f:
            self.get_next_id(f.readlines())
        with open(self.file_descriptor, "r") as file_descriptor:
            blocks: list = []
            counter: int = 0
            file_name: str = ""
            length: str = ""
            message: str = ""

            for line in file_descriptor:
                counter += 1
                if line.startswith(self.block_separator):
                    counter = 0
                if counter == 1:
                    file_name = line.replace("\n", "")
                if counter == 2:
                    length = line.replace("\n", "")
                if counter == 3:
                    message = line.replace("\n", "")
                    blocks.append(self.build_block(file_name, length, message))
            blocks.append(self.final)
            self.write_blocks(blocks)
        os.remove(self.file_descriptor)


if __name__ == "__main__":
    WQ_file_processor()
