-- Spanish (esES / esMX)
local locale = GetLocale()
if locale ~= "esES" and locale ~= "esMX" then return end

WQcategories = {
-- generated at build time
};

WQChannels = {
    ["s"] = { ["name"] = "Decir", ["event"] = "CHAT_MSG_SAY" },
    ["p"] = { ["name"] = "Grupo", ["event"] = "CHAT_MSG_PARTY" },
    ["r"] = { ["name"] = "Banda", ["event"] = "CHAT_MSG_RAID"},
    ["g"] = { ["name"] = "Hermandad", ["event"] = "CHAT_MSG_GUILD"},
	["o"] = { ["name"] = "Oficiales", ["event"] = "CHAT_MSG_OFFICER"}
};

WQ_HELP = {
    "--- WoWQuote2 AYUDA ---\n",
	"|cffffffff- /wqh : |r |cff7090ffMuestra esta ayuda",
    "|cffffffff- /wqb [canal] [on|off]: |r |cff7090ffMuestra o gestiona la configuracion de difusion para un canal. Canales posibles: s(ay), p(arty), r(aid), g(uild) u (o)ficiales",
    "|cffffffff- /wqc : |r |cff7090ffLista todas las categorias disponibles con sus identificadores",
    "|cffffffff- /wql <ID-categoria>: |r |cff7090ffLista todas las citas disponibles en la categoria indicada",
    "|cffffffff- /wqf <cadena>: |r |cff7090ffLista todas las citas que contienen la cadena indicada",
    "|cffffffff- /wqa <ID-cita> [alias]: |r |cff7090ffAsigna un alias personalizado a una cita. Sin alias, se elimina el alias existente",
    "|cffffffff- /wqs <ID-cita|alias>: |r |cff7090ffCitar en decir",
    "|cffffffff- /wqp <ID-cita|alias>: |r |cff7090ffCitar en grupo",
    "|cffffffff- /wqg <ID-cita|alias>: |r |cff7090ffCitar en hermandad",
    "|cffffffff- /wqr <ID-cita|alias>: |r |cff7090ffCitar en banda",
    "|cffffffff- /wqo <ID-cita|alias>: |r |cff7090ffCitar en canal de oficiales"
};

WQ_MSG = {
	["msg_loaded"] = "%s v%s cargado. Escribe /wqh para ayuda en consola, /wq para abrir la interfaz grafica",
	["msg_cat_title"] = "%s - Categorias disponibles:",
	["msg_conf_title"] = "%s - Configuracion de difusion actual:",
	["msg_qlist_title"] = "\n%s - Citas de '%s':",
	["err_cat_id"] = "Se esperaba un ID de categoria valido. Usa /wqc para ver un resumen.",
	["err_quote_not_found"] = "Cita \"%s\" no encontrada.",
	["err_miss_channel"] = "El canal debe ser s, p, r, g u o.",
	["err_miss_switch"] = "Por favor indica on u off.",
	["err_no_alias_id"] = "Uso: /wqa <ID-cita> [alias]",
	["err_wrong_alias"] = "Alias no valido. Solo se permiten letras y numeros. El primer caracter debe ser una letra. El alias no puede superar los 20 caracteres.",
	["err_alias_not_found"] = "La cita %s no tiene ningun alias definido.",
	["msg_alias_disabled"] = "El alias de la cita %s ha sido eliminado.",
	["msg_alias_set"] = "El alias de la cita %s se ha establecido en '%s'.",
	["msg_chan_on"] = "La recepcion en el canal '%s' ha sido ACTIVADA.",
	["msg_chan_off"] = "La recepcion en el canal '%s' ha sido DESACTIVADA.",
	["err_search_len"] = "La cadena de busqueda debe tener al menos %s caracteres.",
	["msg_search_count"] = "%s citas encontradas."
};
