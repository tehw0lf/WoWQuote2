WoWQuote2
-----------------------------

A World of Warcraft AddOn that allows players to play and broadcast sound clips
(quotes) in chat channels. When a player sends a quote message, other players
with the addon installed will hear the corresponding sound file play automatically.

Supported clients: Vanilla (1.12), TBC (2.4), WotLK (3.3.5)


*** IMPORTANT: THIS RELEASE CONTAINS NO SOUNDS ***

The release archive ships the AddOn code only. After installing, the quote list
is empty and /wq opens an empty dialog. This is intentional - the sound files are
user-supplied and are not distributed with the AddOn.

Add sounds with WoWQuote2 Manager, a browser app that runs entirely on your own
machine:

  https://tehw0lf.github.io/WoWQuote2-Manager/

Drop in your MP3 files, export an update ZIP for your client version, and extract
it over the installed WoWQuote2 folder. See INSTALLATION below first.


*** INSTALLATION ***

Extract the ZIP archive into the AddOns directory of your WoW installation:
  <WoW installation directory>\Interface\AddOns

After extraction, a folder named "WoWQuote2" must exist there:
  <WoW installation directory>\Interface\AddOns\WoWQuote2

The folder must be named exactly WoWQuote2, and WoWQuote2.toc must sit directly
inside it. WoW only loads an AddOn whose folder and .toc names match. Some archive
tools add an extra nesting level - if you end up with
AddOns\WoWQuote2\WoWQuote2\, move the inner folder up one level.

If the game is currently running, you MUST restart it completely for the new
AddOn to be loaded. Relogging your character is not sufficient.


*** GETTING STARTED ***

Type /wq in the chat window to open the graphical user interface.
Type /wqh to see a list of all available console commands.

A keybinding to toggle the WoWQuote2 dialog can be set in the game's
main menu under Key Bindings.


*** SLASH COMMANDS ***

/wq, /wq2           Open the graphical UI
/wqh                Show help
/wqb [ch] [on|off]  Configure broadcast channels (s/p/r/g/o)
/wqs <id|alias>     Quote to say
/wqp <id|alias>     Quote to party
/wqr <id|alias>     Quote to raid
/wqg <id|alias>     Quote to guild
/wqo <id|alias>     Quote to officer channel
/wql <cat-id>       List quotes in category
/wqc                List categories
/wqf <string>       Search quotes by text
/wqa <id> [alias]   Set or clear an alias for a quote id

Every command also has a long form: /wqhelp, /wqbroadcast, /wqsay, /wqparty,
/wqraid, /wqguild, /wqofficer, /wqlist, /wqcategory, /wqfind, /wqalias.


*** LOCALIZATION ***

WoWQuote2 automatically detects your WoW client language and displays
interface text accordingly. Supported languages: English (default),
German, French, Dutch, Spanish, Portuguese.


*** DISCLAIMER ***

This AddOn is a third-party interface extension for World of Warcraft.
Its use is entirely voluntary and not required for normal gameplay.
Neither Blizzard Entertainment nor the authors of this AddOn accept any
liability for damages or inconveniences arising from its use.

Authors: Lev@Die Ewige Wacht, Harag@Die Ewige Wacht, tehw0lf
URL: https://github.com/tehw0lf/WoWQuote2
