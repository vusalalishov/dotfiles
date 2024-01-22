Mappings = {}

Mapping = {
    mode = "",
    key = "",
    description = ""
}

function Mapping:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

Remap = function (mode, key, map, opts, description)
    vim.keymap.set(mode, key, map, opts)
    Mappings[mode .. key] = Mapping:new{mode = mode, key = key, description = description}
end

Help = function()
    for _, m in pairs(Mappings) do
        print(m.mode, " ", m.key, " ", m.description)
    end
end
