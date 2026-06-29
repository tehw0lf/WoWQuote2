# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **WoWQuote2**, a World of Warcraft AddOn that allows players to play and broadcast sound clips (quotes) in chat channels. When a player sends a quote message, other players with the addon installed will hear the corresponding sound file play automatically.

The repo contains three WoW client version variants (**TBC** = The Burning Crusade, **Vanilla** = Classic, **WOTLK** = Wrath of the Lich King), a shared AddOn core (`WoWQuote2/`), and a Python build script.

## Build System

There is no separate build step for the Lua addon itself — WoW loads it directly. The Python build script handles releasing and adding new sounds:

```bash
# Package release ZIPs for TBC, Vanilla and WOTLK and process new sound uploads
python insert_and_build.py
```

This script:
1. Extracts any `.zip` files placed in `Upload/` (each must contain a `file_descriptor.txt` and `.mp3` files)
2. Parses `file_descriptor.txt` to auto-number and rename sound files, then inserts new entries into `WoWQuote2/Media.lua`
3. Produces dated release ZIPs in `Release/` (e.g. `WQ2-TBC-2024-01-01.zip`, `WQ2-Vanilla-2024-01-01.zip`, `WQ2-WOTLK-2024-01-01.zip`) by combining the shared `WoWQuote2/` core with version-specific TOC and UI files from `TBC/`, `Vanilla/`, or `WOTLK/`

## Architecture

### File Loading Order (defined in `.toc`)
1. `Media.lua` — `WQmedia` table: all sound entries (id, file, len, msg, cat)
2. `Localization.en.lua` — `WQcategories`, `WQChannels`, `WQ_HELP`, `WQ_MSG` tables (English, always loaded as fallback)
3. `Localization.de.lua` / `Localization.fr.lua` / `Localization.nl.lua` / `Localization.es.lua` / `Localization.pt.lua` — locale overrides, each guarded by `GetLocale()` so only the matching one applies
4. `WoWQuote2.lua` — core addon logic (event handling, slash commands, playback)
5. `WoWQuote2.xml` — WoW XML frame that wires `ADDON_LOADED` and chat events to `WQ_OnEvent`
6. `WoWQuote2UI.lua` — `WQUI` table/object: graphical dialog with category/channel dropdowns and quote list
7. `LocalizationUI.en.lua` + locale-specific `LocalizationUI.*.lua` — UI localization strings (same fallback pattern)
8. `WoWQuote2UI.xml` — XML layout for the UI dialog

### Supported Locales
| File | Language | Locale code(s) |
|---|---|---|
| `Localization.en.lua` | English (fallback) | all others |
| `Localization.de.lua` | German | `deDE` |
| `Localization.fr.lua` | French | `frFR` |
| `Localization.nl.lua` | Dutch | `nlNL` (community) |
| `Localization.es.lua` | Spanish | `esES`, `esMX` |
| `Localization.pt.lua` | Portuguese | `ptBR` |

### Version-Specific Files (TBC/, Vanilla/, WOTLK/)
Each version directory contains its own `WoWQuote2.toc`, `WoWQuote2UI.lua`, and `WoWQuote2UI.xml`. These are copied into `WoWQuote2/` by `insert_and_build.py` before packaging, replacing the shared stubs. The differences accommodate API changes between WoW client versions (e.g. `GetNumRaidMembers()` vs group API).

### Sound Trigger Mechanism
Sounds are triggered via a text pattern embedded in chat messages: `(~<id>~)`. When `WQ_OnEvent` receives a chat event, it calls `WQ_CatchMedia` which extracts the numeric or string id from this pattern, then calls `WQ_Play`. The `WQ_Send` function composes the full chat message including this pattern so that other clients can catch it.

### Media Entry Format (Media.lua)
```lua
{   id = "prefix:NNN",
    file = "prefix_NNN.mp3",
    len = 3,         -- playback duration in seconds (used as delay before next sound)
    msg = "Display text",
    cat = 1          -- category index matching WQcategories
},
```
The script uses `-- end of <prefix> media data` sentinel comments to know where to insert new blocks. Each sound contributor has their own named prefix (e.g. `murfy`, `helge`, `default`).

### Category Format (media_data.lua)

Categories support optional per-locale translations. The `en` key is required and used as fallback for any missing language:

```lua
WQcategories_data = {
    { en = "My Category" },                          -- English only, used as fallback
    { en = "Default", de = "Standard", fr = "Divers", nl = "Standaard", es = "Predeterminado", pt = "Padrao" },
};
```

Plain strings (`"Name"`) are also accepted for backwards compatibility and treated as the English name.

Supported language keys: `en`, `de`, `fr`, `nl`, `es`, `pt`. The `LOCALE_LANG` map in `insert_and_build.py` controls which locale file each key maps to.

### Adding New Sound Packs
To add sounds for a new contributor prefix, update `insert_and_build.py`:
- `self.prefix` — contributor name prefix
- `self.start_indicator` — must match `-- end of <prefix> media data` sentinel in `Media.lua`

## CI/CD

GitHub Actions pipeline at `.github/workflows/release.yml`:
- **Pull request**: builds all three release ZIPs and uploads them as a workflow artifact for verification
- **Push to `main`**: builds ZIPs and creates a GitHub Release tagged with the version from `TBC/WoWQuote2.toc`, skipped if the tag already exists

To release a new version: bump `## Version:` in all three TOC files (`TBC/`, `Vanilla/`, `WOTLK/`), commit, and push to `main`.

## Slash Commands (in-game)
- `/wq` or `/wq2` — open graphical UI
- `/wqh` — help
- `/wqb [channel] [on|off]` — configure broadcast channels (s/p/r/g/o)
- `/wqs|p|r|g|o <id|alias>` — send quote to say/party/raid/guild/officer
- `/wql <cat-id>` — list quotes in category
- `/wqc` — list categories
- `/wqf <string>` — search quotes by text
- `/wqa <id> [alias]` — set or clear alias for a quote id
