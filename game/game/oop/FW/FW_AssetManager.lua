AssetManager = Object:extend()

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

function AssetManager:getType()
    return self
end

function AssetManager:Add(type,asset, path)
    if (type ~= nil and asset ~= nil) then
        print(self)
        table.insert(self.assets,{type = type,asset = asset, path = path})
    end
end

function AssetManager:LoadAssets(screen)
    for i,v in pairs(self.assets) do
        love.filesystem.load(v.asset)
    end
    screen.assetsLoaded = true
end

