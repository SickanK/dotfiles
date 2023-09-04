--[[
local cmp_css_properties = require("cmp_css_properties")

cmp_css_properties.get_sources = function()
    return {
        --"node_modules/open-props/open-props.min.css",
        "variables/"
    }
end

cmp_css_properties.handle_import_path = function(import)
    if vim.split(import, "/")[1] == "open-props" then
        return "node_modules/" .. import .. ".min.css"
    end

    return nil
end
]]
   --
