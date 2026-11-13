--// CÁCH DÙNG CUTINS HACK UI
-- Tải Library từ GitHub của bạn
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/trec122222/CuTins-UI/refs/heads/main/source.lua"))()

-- Khởi tạo UI (Chỉ cần truyền Game Name)
Library:Init({
    Game = "Arsenal"
})

--// TẠO TAB
local MainTab = Library:CreateTab("Main")
local VisualTab = Library:CreateTab("Visual")

--// THÊM TÍNH NĂNG
Library:CreateToggle(MainTab, "Auto Farm", "Tự động cày", false, function(state)
    print("Auto Farm: ", state)
end)

Library:CreateSlider(MainTab, "WalkSpeed", 16, 200, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

Library:CreateButton(MainTab, "Teleport", function()
    Library:Notify("Teleport", "Đã dịch chuyển!")
end)

Library:CreateTextBox(VisualTab, "FOV", "70", function(text)
    print("FOV set to: ", text)
end)
