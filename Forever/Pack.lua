-- Registers the sounds from Media.lua with the WoWQuote2 core for WoW: Forever.
--
-- Media.lua only holds data (ns.media, ns.categories). Everything that depends
-- on how the core wants its modules lives here, so the WoWQuote2 Manager and the
-- build script only ever have to write data.
local addonName, ns = ...

if type(WQ2_InitModule) ~= "function" then
  print("|cffff8080" .. addonName .. ": the WoWQuote2 AddOn is not loaded, so no sounds were registered.|r")
  return
end

local LANG_BY_LOCALE = {
  deDE = "de", frFR = "fr", nlNL = "nl", esES = "es", esMX = "es", ptBR = "pt",
}
local lang = LANG_BY_LOCALE[GetLocale()] or "en"

local path = "Interface\\AddOns\\" .. addonName .. "\\media\\"

-- A category is the index into ns.categories. The core filters by tag, so each
-- category becomes the tag "c<index>" with the localized category name.
local categoryTags = {}
for i, cat in ipairs(ns.categories or {}) do
  categoryTags["c" .. i] = cat[lang] or cat.en or ("c" .. i)
end

-- The core resolves a quote id such as "murfy:001" to the module "murfy", so
-- there has to be one module per id prefix.
local modules, order = {}, {}
for _, entry in ipairs(ns.media or {}) do
  local prefix = entry.id:match("^(%w+):")
  if not prefix then
    print(addonName .. ": skipped '" .. tostring(entry.id) .. "', ids need the form prefix:number")
  else
    local module = modules[prefix]
    if not module then
      -- No `name`: WQ2_InitModule would add every module as an extra category.
      module = { moduleid = prefix, mediapath = path, tags = categoryTags, mediadata = {} }
      modules[prefix] = module
      order[#order + 1] = module
    end
    module.mediadata[#module.mediadata + 1] = {
      id = entry.id,
      file = entry.file,
      len = entry.len,
      msg = entry.msg,
      tags = { "c" .. tostring(entry.cat) },
    }
  end
end

for _, module in ipairs(order) do
  WQ2_InitModule(module)
end
