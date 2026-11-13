# CuTins Hack - UI Library

A professional, high-performance Roblox UI Library inspired by Rayfield. Built for smooth animations, mobile compatibility, and absolute branding security.

> ⚠️ **Notice:** The name **"CuTins Hack"** is strictly hardcoded. You **cannot** modify, rebrand, or remove the name, watermark, or footer. Any attempt to do so will be automatically reverted by the library.

---

## ✨ Features

- 🎨 **Rayfield-Inspired Design** – Dark theme with neon accents and smooth `Quint/Bounce` animations.
- 🔒 **Hardcoded Branding** – Name `CuTins Hack` is locked in the Launcher, Header, Footer, and an invisible Watermark.
- 📱 **Mobile Optimized** – Auto-resizes to fit small screens (iPhone SE, etc.), with large touch targets.
- 📜 **Scrolling Support** – Vertical scrolling for long feature lists, horizontal scrolling for tabs.
- 🧩 **Sections** – Group features visually (e.g., "Combat", "Visual", "Misc") just like Rayfield.
- 🎛️ **Rich Components** – Toggles, Buttons, Sliders, TextBoxes, Dropdowns, and Notifications.
- ⚡ **Zero-Lag Animations** – Uses `Tween.Completed` instead of `task.wait()` for buttery-smooth transitions.
- 🛡️ **Anti-Spam** – Buttons and toggles are protected against rapid-click glitches.
- 🔔 **Notification System** – Pop-up notifications in the corner of the screen.

---

## 🚀 Quick Start

Load the library using `loadstring` and initialize it with your game name:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/trec122222/CuTins-UI/refs/heads/main/source.lua"))()

Library:Init({
    Game = "Blox Fruits"
})

local Tab = Library:CreateTab("Main")
Library:CreateButton(Tab, "Hello World", function()
    Library:Notify("CuTins Hack", "It works!")
end)
