WoWQuote2 v1.0.0
-----------------------------

A World of Warcraft AddOn that allows players to play and broadcast sound clips
(quotes) in chat channels. When a player sends a quote message, other players
with the addon installed will hear the corresponding sound file play automatically.

Supported clients: Vanilla (1.12), TBC (2.4), WotLK (3.3.5)


*** INSTALLATION ***

Extract the ZIP archive into the AddOns directory of your WoW installation:
  <WoW installation directory>\Interface\AddOns

After extraction, a folder named "WoWQuote" should exist there:
  <WoW installation directory>\Interface\AddOns\WoWQuote

If the game is currently running, you MUST restart it completely for the new
AddOn to be loaded. Relogging your character is not sufficient.


*** GETTING STARTED ***

Type /wq in the chat window to open the graphical user interface.
Type /wqh to see a list of all available console commands.

A keybinding to toggle the WoWQuote dialog can be set in the game's
main menu under Key Bindings.


*** SLASH COMMANDS ***

/wq               Open the graphical UI
/wqh              Show help
/wqb [ch] [on|off]  Configure broadcast channels (s/p/r/g/o)
/wqs <id|alias>   Quote to say
/wqp <id|alias>   Quote to party
/wqr <id|alias>   Quote to raid
/wqg <id|alias>   Quote to guild
/wqo <id|alias>   Quote to officer channel
/wql <cat-id>     List quotes in category
/wqc              List categories
/wqf <string>     Search quotes by text
/wqa <id> [alias] Set or clear an alias for a quote id


*** LOCALIZATION ***

WoWQuote automatically detects your WoW client language and displays
interface text accordingly. Supported languages: English (default),
German, French, Dutch, Spanish, Portuguese.


*** DISCLAIMER ***

This AddOn is a third-party interface extension for World of Warcraft.
Its use is entirely voluntary and not required for normal gameplay.
Neither Blizzard Entertainment nor the authors of this AddOn accept any
liability for damages or inconveniences arising from its use.

Authors: Lev@Die Ewige Wacht, Harag@Die Ewige Wacht, tehw0lf
URL: https://github.com/tehw0lf/WoWQuote
