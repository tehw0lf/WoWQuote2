-- Portuguese (ptBR)
if GetLocale() ~= "ptBR" then return end

WQcategories = {
-- generated at build time
};

WQChannels = {
    ["s"] = { ["name"] = "Dizer", ["event"] = "CHAT_MSG_SAY" },
    ["p"] = { ["name"] = "Grupo", ["event"] = "CHAT_MSG_PARTY" },
    ["r"] = { ["name"] = "Raide", ["event"] = "CHAT_MSG_RAID"},
    ["g"] = { ["name"] = "Guilda", ["event"] = "CHAT_MSG_GUILD"},
	["o"] = { ["name"] = "Oficiais", ["event"] = "CHAT_MSG_OFFICER"}
};

WQ_HELP = {
    "--- WoWQuote2 AJUDA ---\n",
	"|cffffffff- /wqh : |r |cff7090ffMostra esta ajuda",
    "|cffffffff- /wqb [canal] [on|off]: |r |cff7090ffMostra ou gerencia as configuracoes de transmissao de um canal. Canais possiveis: s(ay), p(arty), r(aid), g(uild) ou (o)ficiais",
    "|cffffffff- /wqc : |r |cff7090ffLista todas as categorias disponiveis com seus identificadores",
    "|cffffffff- /wql <ID-categoria>: |r |cff7090ffLista todas as citacoes disponiveis na categoria indicada",
    "|cffffffff- /wqf <texto>: |r |cff7090ffLista todas as citacoes que contem o texto indicado",
    "|cffffffff- /wqa <ID-citacao> [alias]: |r |cff7090ffAtribui um alias personalizado a uma citacao. Sem alias, o alias existente e removido",
    "|cffffffff- /wqs <ID-citacao|alias>: |r |cff7090ffCitar em dizer",
    "|cffffffff- /wqp <ID-citacao|alias>: |r |cff7090ffCitar em grupo",
    "|cffffffff- /wqg <ID-citacao|alias>: |r |cff7090ffCitar em guilda",
    "|cffffffff- /wqr <ID-citacao|alias>: |r |cff7090ffCitar em raide",
    "|cffffffff- /wqo <ID-citacao|alias>: |r |cff7090ffCitar no canal de oficiais"
};

WQ_MSG = {
	["msg_loaded"] = "%s v%s carregado. Digite /wqh para ajuda no console, /wq para abrir a interface grafica",
	["msg_cat_title"] = "%s - Categorias disponiveis:",
	["msg_conf_title"] = "%s - Configuracoes de transmissao atuais:",
	["msg_qlist_title"] = "\n%s - Citacoes de '%s':",
	["err_cat_id"] = "ID de categoria valido esperado! Use /wqc para uma visao geral.",
	["err_quote_not_found"] = "Citacao \"%s\" nao encontrada!",
	["err_miss_channel"] = "O canal deve ser s, p, r, g ou o.",
	["err_miss_switch"] = "Por favor, indique on ou off.",
	["err_no_alias_id"] = "Uso: /wqa <ID-citacao> [alias]",
	["err_wrong_alias"] = "Alias invalido. Somente letras e numeros sao permitidos. O primeiro caractere deve ser uma letra. O alias nao pode ter mais de 20 caracteres.",
	["err_alias_not_found"] = "A citacao %s nao possui alias definido.",
	["msg_alias_disabled"] = "O alias da citacao %s foi removido.",
	["msg_alias_set"] = "O alias da citacao %s foi definido como '%s'.",
	["msg_chan_on"] = "A recepcao no canal '%s' foi ATIVADA.",
	["msg_chan_off"] = "A recepcao no canal '%s' foi DESATIVADA.",
	["err_search_len"] = "O texto de busca deve ter pelo menos %s caracteres.",
	["msg_search_count"] = "%s citacoes encontradas."
};
