AssetManager = Object:extend()
---Ez a funkció létrehozza az asset manager-t.
function AssetManager:new()
    self.assetType = {
        img = "img",
        img_array = "img_array",
        video = "video",
        text = "text",
        sound_source = "sound_source",
        sound_input = "sound_input",
    }
    self.assets = {}
end
---Ez a funkció visszaadja az Asset Manager típust.
---@return self AssetManager
function AssetManager:getType()
    return self
end
---Ez a funkció hozzáad egy asset-et.
---@param type self.assetType
---@param asset str
---@param path str
function AssetManager:Add(asset)
    local type = asset.type
    local path = asset.path
    local love2d_path = asset.love2d
    if (type ~= nil and asset ~= nil) then
        table.insert(self.assets,{type = type,asset = path, path = love2d_path})
    end
end
---Ez a funkció betölti az asseteket ha végeztünk.
---@param screen Screen
function AssetManager:LoadAssets(screen)
    for i,v in pairs(self.assets) do
        love.filesystem.load(v.path)
    end
    screen.assetsLoaded = true
end

