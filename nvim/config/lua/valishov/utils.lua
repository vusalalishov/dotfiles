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

Remap = function (mode, key, map, description)
    vim.keymap.set(mode, key, map)
    table.insert(Mappings, Mapping:new{mode = mode, key = key, description = description})
end

Help = function()
    for i = 1, #Mappings do
        local m = Mappings[i]
        print(m.mode, " ", m.key, " ", m.description)
    end
end
