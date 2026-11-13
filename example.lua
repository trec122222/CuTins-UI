local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/trec122222/CuTins-UI/refs/heads/main/source.lua"))()
Library:Init({ Game = "Blox Fruits" })

--// KHỞI TẠO TAB
local MainTab = Library:CreateTab("Main")
local PlayerTab = Library:CreateTab("Player")
local MiscTab = Library:CreateTab("Misc")

--// TAB MAIN
Library:CreateSection(MainTab, "Combat")
Library:CreateToggle(MainTab, "Auto Farm", "Tự động đánh quái", false, function(s)
    print("Auto Farm: ", s)
end)
Library:CreateDropdown(MainTab, "Target", {"Nearest", "Lowest HP", "Boss"}, function(selected)
    print("Đã chọn mục tiêu: ", selected)
end)
Library:CreateButton(MainTab, "Teleport Spawn", function()
    Library:Notify("Teleport", "Đã về spawn!")
end)

--// TAB PLAYER
Library:CreateSection(PlayerTab, "Movement")
Library:CreateSlider(PlayerTab, "WalkSpeed", 16, 200, 16, function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = v
    end
end)
Library:CreateSlider(PlayerTab, "JumpPower", 50, 500, 50, function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = v
    end
end)

--// TAB MISC (Test thanh cuộn dọc)
Library:CreateSection(MiscTab, "Settings")
Library:CreateTextBox(MiscTab, "Webhook URL", "", function(text)
    print("Đã lưu Webhook: ", text)
end)
for i = 1, 10 do
    Library:CreateButton(MiscTab, "Nút Test " .. i, function() end)
end