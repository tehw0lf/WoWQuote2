# WoWQuote2

A World of Warcraft AddOn that plays and broadcasts sound clips ("quotes") through chat.
When you send a quote, every other player in that channel who has the AddOn installed
hears the same sound clip play automatically.

Supported clients: **Vanilla (1.12)**, **TBC (2.4)**, **WotLK (3.3.5)**.

---

## Important: releases contain no sounds

**The release archives ship the AddOn code only — no MP3s.** A freshly installed release
has an empty quote list, and `/wq` opens an empty dialog. This is intentional, not a
broken download: the sounds are user-supplied and are not distributed here.

To get a working setup you need two steps, in this order:

1. **[Install the AddOn](#1-install-the-addon)** — from a release archive.
2. **[Add sounds with WoWQuote2 Manager](#2-add-sounds)** — this is what fills the quote list.

Skipping step 2 leaves you with an AddOn that loads correctly and does nothing.

---

## 1. Install the AddOn

1. Download the archive for your client from the
   [latest release](https://github.com/tehw0lf/WoWQuote2/releases/latest):

   | Client | Archive |
   |---|---|
   | Vanilla (1.12) | `WQ2-Vanilla-<version>.zip` |
   | TBC (2.4) | `WQ2-TBC-<version>.zip` |
   | WotLK (3.3.5) | `WQ2-WOTLK-<version>.zip` |

2. Extract it into your AddOns directory:

   ```
   <WoW installation directory>\Interface\AddOns
   ```

3. Afterwards a folder named **`WoWQuote2`** must exist there:

   ```
   <WoW installation directory>\Interface\AddOns\WoWQuote2
   ```

   The folder name must stay exactly `WoWQuote2` — the `.toc` file inside is named
   `WoWQuote2.toc`, and WoW only loads an AddOn whose folder and `.toc` names match.

4. **Restart the game completely.** Relogging your character is not enough; a running
   client does not pick up newly added AddOns.

On login you should see a chat message confirming the AddOn loaded. If you do not,
check that the folder is named correctly and that WoWQuote2 is enabled in the
character-select AddOns list.

## 2. Add sounds

Sounds are managed with **[WoWQuote2 Manager](https://github.com/tehw0lf/WoWQuote2-Manager)**,
a browser app that runs entirely client-side — nothing is uploaded anywhere.

**→ [Open the Manager](https://tehw0lf.github.io/WoWQuote2-Manager/)**

You do not need to load anything first. Dropping MP3s into an empty Manager is enough to
get a working set of sounds — it assigns ids, reads the durations, and creates categories
from the filename prefixes on the fly.

1. Open the Manager in your browser.
2. Drop in your MP3 files. The Manager detects durations automatically and lets you set
   the chat message and category for each entry.
3. Export an update ZIP for your client version (TBC / Vanilla / WOTLK). You get a
   `WQ2-<variant>-<date>.zip`.
4. Extract that ZIP into your AddOns directory, over the existing `WoWQuote2` folder.
5. Restart the game.

If you already have a setup, drop it in first and the Manager picks up where you left
off. The sidebar takes a `.zip` as well as loose `.lua` files, so a previously exported
update ZIP can be dragged straight back in — it reads the `media_data.lua` and
`Localization.*.lua` out of it.

The export contains the regenerated `Media.lua`, the patched `Localization.*.lua` files,
and the MP3s you added in this session — it layers over an installed AddOn rather than
replacing it, so adding sounds later does not mean rebuilding everything.

Note that dropping a ZIP in reads only the Lua files out of it, not the MP3s. Sounds
already installed in your game folder stay where they are; the Manager only ever bundles
the ones you drop into it.

Keep the `media_data.lua` the Manager saves. Loading it back on your next visit restores
your entries and categories, which is how you build a collection over time.

## Using it in game

Open the UI with `/wq` (or `/wq2`), and list every command with `/wqh`.

A keybinding to toggle the dialog can be set under **Key Bindings** in the game's main menu.

### Sending quotes

| Command | Sends to |
|---|---|
| `/wqs <id\|alias>` | Say |
| `/wqp <id\|alias>` | Party |
| `/wqr <id\|alias>` | Raid |
| `/wqg <id\|alias>` | Guild |
| `/wqo <id\|alias>` | Officer |

### Finding and managing quotes

| Command | Does |
|---|---|
| `/wq`, `/wq2` | Open the graphical UI |
| `/wqh` | Show help |
| `/wqc` | List all categories with their IDs |
| `/wql <category-id>` | List all quotes in a category |
| `/wqf <string>` | Search quotes by text |
| `/wqa <id> [alias]` | Set an alias for a quote; omit the alias to remove it |
| `/wqb [channel] [on\|off]` | Show or change which channels you receive on |

Every command also has a long form — `/wqhelp`, `/wqfind`, `/wqbroadcast`, `/wqsay` and
so on — if you prefer the readable spelling.

Receiving is configured per channel with `/wqb`. `/wqb` on its own prints your current
settings; `/wqb g off` stops the AddOn playing sounds broadcast to guild chat.

### How broadcasting works

A quote is an ordinary chat message with a marker appended, in the form `(~<id>~)`:

```
[ Some quote text ] (~murfy:028~)
```

Players with the AddOn see the text and hear the sound; the marker tells their client
which clip to play. Players *without* the AddOn just see the line including the marker —
nothing breaks for them, it merely looks like noise. Players who have the AddOn but lack
that particular MP3 hear nothing, since the sound is resolved from their own local files.

## Languages

The AddOn follows your WoW client language. English is the fallback for any client whose
locale is not listed:

| Language | Locale |
|---|---|
| English (fallback) | all others |
| German | `deDE` |
| French | `frFR` |
| Dutch | `nlNL` |
| Spanish | `esES`, `esMX` |
| Portuguese | `ptBR` |

Category names are translated per locale too, via the Manager.

## Troubleshooting

**The AddOn does not appear in the AddOns list.** The folder is probably named something
other than `WoWQuote2` — archive tools like to add a nesting level, leaving
`AddOns\WoWQuote2\WoWQuote2\`. `WoWQuote2.toc` must sit directly inside
`AddOns\WoWQuote2\`.

**It loaded, but the quote list is empty.** Expected on a fresh install — see
[releases contain no sounds](#important-releases-contain-no-sounds) and add them with the
Manager.

**I hear nothing when someone else quotes.** Either you do not have that MP3 locally
(sounds are played from your own files, never streamed), or receiving is off for that
channel — check with `/wqb`. Also make sure sound is enabled in the game and that you
restarted the client after adding files.

**Changes to my sounds are not showing up.** WoW reads AddOn files only at startup.
Restart the client completely.

## Building from source

Contributors and packagers only — as a player you want the
[release archives](https://github.com/tehw0lf/WoWQuote2/releases/latest) instead.

```bash
./build.sh
```

This produces the three client archives in `Release/`. It requires Python 3.9 or newer
and uses the standard library only.

Note that a local build picks up whatever MP3s are present in `WoWQuote2/media/` on your
machine, so your local archives are typically much larger than the published ones. That
difference is expected — the media files and `media_data.lua` are deliberately
gitignored and never committed.

To cut a release, bump `## Version:` in all three TOC files (`TBC/`, `Vanilla/`,
`WOTLK/`), commit and push to `main`. CI derives the release tag from that field, so an
un-bumped version means the tag already exists and nothing is published.

## Credits and license

Originally by Lev@Die Ewige Wacht and Harag@Die Ewige Wacht, derived from Leotard's
WoWQuote. Maintained by [tehw0lf](https://github.com/tehw0lf).

Licensed under the terms in [LICENSE](LICENSE).

This AddOn is a third-party interface extension for World of Warcraft. Its use is
voluntary and not required for normal gameplay. Neither Blizzard Entertainment nor the
authors accept liability for damages arising from its use.
