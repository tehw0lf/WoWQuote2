QuoteMediaWQ2 - sound pack for WoWQuote2 on WoW: Forever
-----------------------------------------------------------

This is a sound pack for the WoWQuote2 AddOn for WoW: Forever (the version
tagged "forever" by Lyphage and contributors). It is NOT an AddOn for the
Vanilla / TBC / WotLK clients - those use the other WQ2-<client> archives.


*** IMPORTANT: THIS RELEASE CONTAINS NO SOUNDS ***

The archive ships the loader only. Sound files are user-supplied. Add yours with
WoWQuote2 Manager, a browser app that runs entirely on your own machine:

  https://tehw0lf.github.io/WoWQuote2-Manager/

Drop in your MP3 files and export the "Forever" ZIP. It contains the same
folder with your sounds and their list already in it.


*** INSTALLATION ***

1. Install the WoWQuote2 AddOn for WoW: Forever first. This pack needs it.
2. Extract the archive into the AddOns directory:
     <WoW installation directory>\Interface\AddOns
   After extraction, a folder named "QuoteMediaWQ2" must exist there, with
   QuoteMediaWQ2.toc directly inside it.
3. Restart the game completely. Relogging is not enough.

Type /wqdebug in game to check that the pack is loaded.


*** NOTES ***

- Quote ids keep the form prefix:number (for example murfy:001) and each prefix
  becomes its own module. The prefix "default" is also the name of the module
  the WoWQuote2 core treats as its legacy one, so another pack that registers
  "default" ids will clash with this one.
- Do not install this pack together with another pack that registers the same
  ids, e.g. a hand-made copy of the same sounds.

Authors: Lev@Die Ewige Wacht, Harag@Die Ewige Wacht, tehw0lf
URL: https://github.com/tehw0lf/WoWQuote2
