# Usage

Upload new sounds with file descriptors as zip archive here. The new sounds will be processed automatically and new zip archives will be generated for download in Release/. There should be no subdirectories in the zip archive.

The zip archive can be directly dragged and dropped into this window.

## The file descriptor

The file descriptor needs to be called file_descriptor.txt and contain a block in the following format for each new sound:

- File name
- Length in seconds
- Message to be shown in chat

```
--
my_sound.mp3
3
Testy test
```

## Adding categories

Categories are defined in `media_data.lua` in the root of the repository. Each category entry supports an optional localized name per language. If no localization is provided for a language, the English name (`en`) is used as fallback.

**Simple (English only):**
```lua
WQcategories_data = {
    { en = "My Category" },
};
```

**With localizations:**
```lua
WQcategories_data = {
    { en = "My Category", de = "Meine Kategorie", fr = "Ma categorie", nl = "Mijn categorie", es = "Mi categoria", pt = "Minha categoria" },
};
```

**Plain strings are also accepted for backwards compatibility** (treated as English name):
```lua
WQcategories_data = {
    "My Category",
};
```

Supported language keys: `en`, `de`, `fr`, `nl`, `es`, `pt`.
