-- English (base locale / fallback for all unsupported clients)

WQcategories = {
-- generated at build time
};

WQChannels = {
    ["s"] = { ["name"] = "Say", ["event"] = "CHAT_MSG_SAY" },
    ["p"] = { ["name"] = "Party", ["event"] = "CHAT_MSG_PARTY" },
    ["r"] = { ["name"] = "Raid", ["event"] = "CHAT_MSG_RAID"},
    ["g"] = { ["name"] = "Guild", ["event"] = "CHAT_MSG_GUILD"},
	["o"] = { ["name"] = "Officer", ["event"] = "CHAT_MSG_OFFICER"}
};

WQ_HELP = {
    "--- WoWQuote2 HELP ---\n",
	"|cffffffff- /wqh : |r |cff7090ffShows this help",
    "|cffffffff- /wqb [channel] [on|off]: |r |cff7090ffShows or manages broadcast settings for a channel. Possible channels are: s(ay), p(arty), r(aid), g(uild) or (o)fficer",
    "|cffffffff- /wqc : |r |cff7090ffLists all available categories with IDs",
    "|cffffffff- /wql <category-ID>: |r |cff7090ffLists all available quotes in the given category with IDs",
    "|cffffffff- /wqf <string>: |r |cff7090ffLists all quotes containing the given string",
    "|cffffffff- /wqa <quote-ID> [alias]: |r |cff7090ffAssigns a custom alias to a quote. If the alias is omitted, the existing alias is removed",
    "|cffffffff- /wqs <quote-ID|alias>: |r |cff7090ffQuote to say",
    "|cffffffff- /wqp <quote-ID|alias>: |r |cff7090ffQuote to party",
    "|cffffffff- /wqg <quote-ID|alias>: |r |cff7090ffQuote to guild",
    "|cffffffff- /wqr <quote-ID|alias>: |r |cff7090ffQuote to raid",
    "|cffffffff- /wqo <quote-ID|alias>: |r |cff7090ffQuote to officer channel"
};

WQ_MSG = {
	["msg_loaded"] = "%s v%s loaded. Type /wqh for console help, /wq to open the graphical user interface",
	["msg_cat_title"] = "%s - Available categories:",
	["msg_conf_title"] = "%s - Current broadcast settings:",
	["msg_qlist_title"] = "\n%s - Quotes from '%s':",
	["err_cat_id"] = "Valid category ID expected! Use /wqc for an overview.",
	["err_quote_not_found"] = "Quote ID \"%s\" not found!",
	["err_miss_channel"] = "Channel must be s, p, r, g or o.",
	["err_miss_switch"] = "Please specify on or off.",
	["err_no_alias_id"] = "Usage: /wqa <quote-ID> [alias]",
	["err_wrong_alias"] = "Invalid alias. Only letters and numbers are allowed. The first character must be a letter. The alias must not exceed 20 characters.",
	["err_alias_not_found"] = "Quote ID %s has no alias defined.",
	["msg_alias_disabled"] = "Alias for quote ID %s has been removed.",
	["msg_alias_set"] = "Alias for quote ID %s has been set to '%s'.",
	["msg_chan_on"] = "Receiving on channel '%s' has been ENABLED.",
	["msg_chan_off"] = "Receiving on channel '%s' has been DISABLED.",
	["err_search_len"] = "Search string must be at least %s characters long.",
	["msg_search_count"] = "%s quotes found."
};
