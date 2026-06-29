-- French (frFR)
if GetLocale() ~= "frFR" then return end

WQcategories = {
-- generated at build time
};

WQChannels = {
    ["s"] = { ["name"] = "Conversation", ["event"] = "CHAT_MSG_SAY" },
    ["p"] = { ["name"] = "Groupe", ["event"] = "CHAT_MSG_PARTY" },
    ["r"] = { ["name"] = "Raid", ["event"] = "CHAT_MSG_RAID"},
    ["g"] = { ["name"] = "Guilde", ["event"] = "CHAT_MSG_GUILD"},
	["o"] = { ["name"] = "Officiers", ["event"] = "CHAT_MSG_OFFICER"}
};

WQ_HELP = {
    "--- WoWQuote2 AIDE ---\n",
	"|cffffffff- /wqh : |r |cff7090ffAffiche cette aide",
    "|cffffffff- /wqb [canal] [on|off]: |r |cff7090ffAffiche ou gere les parametres de diffusion pour un canal. Canaux possibles : s(ay), p(arty), r(aid), g(uild) ou (o)fficer",
    "|cffffffff- /wqc : |r |cff7090ffListe toutes les categories disponibles avec leurs identifiants",
    "|cffffffff- /wql <ID-categorie>: |r |cff7090ffListe toutes les citations disponibles dans la categorie donnee",
    "|cffffffff- /wqf <chaine>: |r |cff7090ffListe toutes les citations contenant la chaine donnee",
    "|cffffffff- /wqa <ID-citation> [alias]: |r |cff7090ffAssigne un alias personnalise a une citation. Sans alias, l'alias existant est supprime",
    "|cffffffff- /wqs <ID-citation|alias>: |r |cff7090ffCiter en conversation",
    "|cffffffff- /wqp <ID-citation|alias>: |r |cff7090ffCiter en groupe",
    "|cffffffff- /wqg <ID-citation|alias>: |r |cff7090ffCiter en guilde",
    "|cffffffff- /wqr <ID-citation|alias>: |r |cff7090ffCiter en raid",
    "|cffffffff- /wqo <ID-citation|alias>: |r |cff7090ffCiter dans le canal officiers"
};

WQ_MSG = {
	["msg_loaded"] = "%s v%s charge. Tapez /wqh pour l'aide console, /wq pour ouvrir l'interface graphique",
	["msg_cat_title"] = "%s - Categories disponibles :",
	["msg_conf_title"] = "%s - Parametres de diffusion actuels :",
	["msg_qlist_title"] = "\n%s - Citations de '%s' :",
	["err_cat_id"] = "Identifiant de categorie valide attendu ! Utilisez /wqc pour un apercu.",
	["err_quote_not_found"] = "Citation \"%s\" introuvable !",
	["err_miss_channel"] = "Le canal doit etre s, p, r, g ou o.",
	["err_miss_switch"] = "Veuillez indiquer on ou off.",
	["err_no_alias_id"] = "Utilisation : /wqa <ID-citation> [alias]",
	["err_wrong_alias"] = "Alias invalide. Seules les lettres et chiffres sont autorises. Le premier caractere doit etre une lettre. L'alias ne peut pas depasser 20 caracteres.",
	["err_alias_not_found"] = "La citation %s n'a pas d'alias defini.",
	["msg_alias_disabled"] = "L'alias de la citation %s a ete supprime.",
	["msg_alias_set"] = "L'alias de la citation %s a ete defini sur '%s'.",
	["msg_chan_on"] = "La reception sur le canal '%s' a ete ACTIVEE.",
	["msg_chan_off"] = "La reception sur le canal '%s' a ete DESACTIVEE.",
	["err_search_len"] = "La chaine de recherche doit comporter au moins %s caracteres.",
	["msg_search_count"] = "%s citations trouvees."
};
