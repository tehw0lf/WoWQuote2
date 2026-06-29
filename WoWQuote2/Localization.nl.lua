-- Dutch (nlNL) - community locale, not an official WoW client locale
if GetLocale() ~= "nlNL" then return end

WQcategories = {
-- generated at build time
};

WQChannels = {
    ["s"] = { ["name"] = "Zeggen", ["event"] = "CHAT_MSG_SAY" },
    ["p"] = { ["name"] = "Groep", ["event"] = "CHAT_MSG_PARTY" },
    ["r"] = { ["name"] = "Raid", ["event"] = "CHAT_MSG_RAID"},
    ["g"] = { ["name"] = "Gilde", ["event"] = "CHAT_MSG_GUILD"},
	["o"] = { ["name"] = "Officieren", ["event"] = "CHAT_MSG_OFFICER"}
};

WQ_HELP = {
    "--- WoWQuote2 HELP ---\n",
	"|cffffffff- /wqh : |r |cff7090ffToont deze hulp",
    "|cffffffff- /wqb [kanaal] [on|off]: |r |cff7090ffToont of beheert uitzendinstellingen voor een kanaal. Mogelijke kanalen: s(ay), p(arty), r(aid), g(uild) of (o)fficier",
    "|cffffffff- /wqc : |r |cff7090ffToont alle beschikbare categorieen met ID's",
    "|cffffffff- /wql <categorie-ID>: |r |cff7090ffToont alle beschikbare quotes in de opgegeven categorie",
    "|cffffffff- /wqf <tekst>: |r |cff7090ffToont alle quotes die de opgegeven tekst bevatten",
    "|cffffffff- /wqa <quote-ID> [alias]: |r |cff7090ffWijst een alias toe aan een quote. Zonder alias wordt de bestaande alias verwijderd",
    "|cffffffff- /wqs <quote-ID|alias>: |r |cff7090ffQuote zeggen",
    "|cffffffff- /wqp <quote-ID|alias>: |r |cff7090ffQuote in groep",
    "|cffffffff- /wqg <quote-ID|alias>: |r |cff7090ffQuote in gilde",
    "|cffffffff- /wqr <quote-ID|alias>: |r |cff7090ffQuote in raid",
    "|cffffffff- /wqo <quote-ID|alias>: |r |cff7090ffQuote in officierenkanaal"
};

WQ_MSG = {
	["msg_loaded"] = "%s v%s geladen. Typ /wqh voor consolehulp, /wq om de grafische interface te openen",
	["msg_cat_title"] = "%s - Beschikbare categorieen:",
	["msg_conf_title"] = "%s - Huidige uitzendinstellingen:",
	["msg_qlist_title"] = "\n%s - Quotes uit '%s':",
	["err_cat_id"] = "Geldig categorie-ID verwacht! Gebruik /wqc voor een overzicht.",
	["err_quote_not_found"] = "Quote-ID \"%s\" niet gevonden!",
	["err_miss_channel"] = "Kanaal moet s, p, r, g of o zijn.",
	["err_miss_switch"] = "Geef alstublieft on of off op.",
	["err_no_alias_id"] = "Gebruik: /wqa <quote-ID> [alias]",
	["err_wrong_alias"] = "Ongeldige alias. Alleen letters en cijfers zijn toegestaan. Het eerste teken moet een letter zijn. De alias mag maximaal 20 tekens lang zijn.",
	["err_alias_not_found"] = "Quote-ID %s heeft geen alias gedefinieerd.",
	["msg_alias_disabled"] = "Alias voor quote-ID %s is verwijderd.",
	["msg_alias_set"] = "Alias voor quote-ID %s is ingesteld op '%s'.",
	["msg_chan_on"] = "Ontvangst op kanaal '%s' is INGESCHAKELD.",
	["msg_chan_off"] = "Ontvangst op kanaal '%s' is UITGESCHAKELD.",
	["err_search_len"] = "De zoektekenreeks moet minstens %s tekens lang zijn.",
	["msg_search_count"] = "%s quotes gevonden."
};
