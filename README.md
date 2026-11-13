# CuTins Hack UI Library

A professional, high-performance Roblox UI Library inspired by Rayfield. Built for smooth animations, mobile compatibility, and ease of use.

## ✨ Features
- **Hardcoded Branding**: The name "CuTins Hack" is strictly locked. Cannot be modified or removed.
- **Smooth Animations**: Quint/Bounce tweening for buttery-smooth transitions.
- **Mobile Optimized**: Safe insets, scrollable tabs, and responsive sizing.
- **Modern Components**: Toggles, Sliders, TextBoxes, Dropdowns, and Notifications.
- **Easy Integration**: 1-line `loadstring` to inject the UI into any script.

## 🚀 Quick Start

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/source.lua"))()

Library:Init({
    Game = "Blox Fruits"
})

local Tab = Library:CreateTab("Main")
Library:CreateButton(Tab, "Hello World", function()
    Library:Notify("CuTins Hack", "It works!")
end)
