local M = {}

local configuration = vim.api.nvim_call_function('sonokai#get_configuration', {})
local palette = vim.api.nvim_call_function('sonokai#get_palette', {
  configuration.style,
  configuration.colors_override,
})

M.palette = palette

--- Alpha blend two hex colors
---@param fg string Foreground color (hex, e.g. "#ff0000")
---@param bg string Background color (hex, e.g. "#000000")
---@param alpha number Alpha value between 0 and 1
---@return string Blended color (hex)
function M.alpha_blend(fg, bg, alpha)
  local function hex_to_rgb(hex)
    hex = hex:gsub('#', '')
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  end

  local fg_r, fg_g, fg_b = hex_to_rgb(fg)
  local bg_r, bg_g, bg_b = hex_to_rgb(bg)

  local r = math.floor(fg_r * alpha + bg_r * (1 - alpha))
  local g = math.floor(fg_g * alpha + bg_g * (1 - alpha))
  local b = math.floor(fg_b * alpha + bg_b * (1 - alpha))

  return string.format('#%02x%02x%02x', r, g, b)
end

return M
