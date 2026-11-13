local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local Library = {}
local COLORS = {
    bg = Color3.fromRGB(8, 14, 15),
    panel = Color3.fromRGB(12, 22, 24),
    panel2 = Color3.fromRGB(18, 32, 35),
    line = Color3.fromRGB(30, 52, 56),
    neon = Color3.fromRGB(0, 255, 198),
    danger = Color3.fromRGB(255, 59, 92),
    text = Color3.fromRGB(200, 247, 239),
    muted = Color3.fromRGB(95, 139, 134),
}
local FONT = Enum.Font.Code
local TWEEN_SMOOTH = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local TWEEN_BOUNCE = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local TWEEN_FADE = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

local function corner(parent, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r)
    c.Parent = parent
    return c
end

local function stroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = thickness or 1
    s.Transparency = transparency or 0
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local notifGui = Instance.new("ScreenGui")
notifGui.Name = "CuTinNotifs"
notifGui.ResetOnSpawn = false
notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
notifGui.Parent = playerGui

function Library:Notify(title, text)
    local success, err = pcall(function()
        local notif = Instance.new("Frame")
        notif.Size = UDim2.fromOffset(250, 60)
        notif.Position = UDim2.new(1, 350, 0.8, 0)
        notif.BackgroundColor3 = COLORS.panel
        notif.Parent = notifGui
        corner(notif, 8)
        stroke(notif, COLORS.neon, 1, 0.5)
        
        local t1 = Instance.new("TextLabel")
        t1.BackgroundTransparency = 1
        t1.Size = UDim2.new(1, -20, 0, 20)
        t1.Position = UDim2.fromOffset(10, 8)
        t1.Text = title
        t1.TextColor3 = COLORS.neon
        t1.Font = FONT
        t1.TextSize = 14
        t1.TextXAlignment = Enum.TextXAlignment.Left
        t1.Parent = notif

        local t2 = Instance.new("TextLabel")
        t2.BackgroundTransparency = 1
        t2.Size = UDim2.new(1, -20, 0, 20)
        t2.Position = UDim2.fromOffset(10, 30)
        t2.Text = text
        t2.TextColor3 = COLORS.text
        t2.Font = FONT
        t2.TextSize = 11
        t2.TextXAlignment = Enum.TextXAlignment.Left
        t2.Parent = notif

        TweenService:Create(notif, TWEEN_SMOOTH, { Position = UDim2.new(1, -260, 0.8, 0) }):Play()
        task.delay(3, function()
            local tween = TweenService:Create(notif, TWEEN_SMOOTH, { Position = UDim2.new(1, 350, 0.8, 0) })
            tween:Play()
            tween.Completed:Connect(function() notif:Destroy() end)
        end)
    end)
    if not success then warn("[CuTins Notify Error]: " .. tostring(err)) end
end

function Library:Init(config)
    local success, err = pcall(function()
        config = config or {}
        local HACK_NAME = "CuTins Hack" 
        local GAME_NAME = config.Game or "Roblox Game"

        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "CuTinHack"
        screenGui.ResetOnSpawn = false
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        screenGui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
        screenGui.IgnoreGuiInset = true
        screenGui.Parent = playerGui

        local launcher = Instance.new("TextButton")
        launcher.Name = "Launcher"
        launcher.AnchorPoint = Vector2.new(0.5, 0)
        launcher.Size = UDim2.fromOffset(150, 38)
        launcher.BackgroundColor3 = COLORS.panel
        launcher.BackgroundTransparency = 0.4
        launcher.Text = ""
        launcher.AutoButtonColor = false
        launcher.BorderSizePixel = 0
        launcher.Position = UDim2.new(0.5, 0, 0.05, 0)
        launcher.Parent = screenGui
        corner(launcher, 8)
        stroke(launcher, COLORS.neon, 1, 0.4)

        local lTitle = Instance.new("TextLabel")
        lTitle.BackgroundTransparency = 1
        lTitle.Text = HACK_NAME
        lTitle.TextColor3 = COLORS.neon
        lTitle.Font = FONT
        lTitle.TextSize = 13
        lTitle.TextXAlignment = Enum.TextXAlignment.Left
        lTitle.Size = UDim2.new(1, -12, 0, 16)
        lTitle.Position = UDim2.fromOffset(8, 4)
        lTitle.Parent = launcher

        local lGame = Instance.new("TextLabel")
        lGame.BackgroundTransparency = 1
        lGame.Text = GAME_NAME
        lGame.TextColor3 = COLORS.muted
        lGame.Font = FONT
        lGame.TextSize = 10
        lGame.TextXAlignment = Enum.TextXAlignment.Left
        lGame.Size = UDim2.new(1, -12, 0, 12)
        lGame.Position = UDim2.fromOffset(8, 20)
        lGame.Parent = launcher

        local panel = Instance.new("Frame")
        panel.Name = "Panel"
        panel.AnchorPoint = Vector2.new(0.5, 0)
        panel.BackgroundColor3 = COLORS.bg
        panel.BorderSizePixel = 0
        panel.Visible = false
        panel.Size = UDim2.fromOffset(0, 0)
        panel.Parent = screenGui
        corner(panel, 12)
        stroke(panel, COLORS.line, 1, 0)

        local header = Instance.new("Frame")
        header.BackgroundColor3 = COLORS.panel
        header.BorderSizePixel = 0
        header.Size = UDim2.new(1, 0, 0, 60)
        header.Parent = panel
        corner(header, 12)

        local title = Instance.new("TextLabel")
        title.BackgroundTransparency = 1
        title.Text = HACK_NAME
        title.TextColor3 = COLORS.neon
        title.Font = FONT
        title.TextSize = 18
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Size = UDim2.new(1, -60, 0, 20)
        title.Position = UDim2.fromOffset(16, 8)
        title.Parent = header

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.fromOffset(40, 40)
        closeBtn.Position = UDim2.new(1, -50, 0, 10)
        closeBtn.BackgroundColor3 = COLORS.danger
        closeBtn.BackgroundTransparency = 0.85
        closeBtn.Text = "X"
        closeBtn.TextColor3 = COLORS.danger
        closeBtn.Font = FONT
        closeBtn.TextSize = 16
        closeBtn.AutoButtonColor = false
        closeBtn.Parent = header
        corner(closeBtn, 8)
        stroke(closeBtn, COLORS.danger, 1, 0.6)

        local tabsScroll = Instance.new("ScrollingFrame")
        tabsScroll.BackgroundColor3 = COLORS.panel2
        tabsScroll.BorderSizePixel = 0
        tabsScroll.Size = UDim2.new(1, 0, 0, 36)
        tabsScroll.Position = UDim2.new(0, 0, 0, 60)
        tabsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabsScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
        tabsScroll.ScrollingDirection = Enum.ScrollingDirection.X
        tabsScroll.ScrollBarThickness = 0
        tabsScroll.Parent = panel
        local tabsLayout = Instance.new("UIListLayout")
        tabsLayout.FillDirection = Enum.FillDirection.Horizontal
        tabsLayout.Padding = UDim.new(0, 2)
        tabsLayout.Parent = tabsScroll

        local content = Instance.new("ScrollingFrame")
        content.BackgroundTransparency = 1
        content.BorderSizePixel = 0
        content.ScrollBarThickness = 4
        content.ScrollBarImageColor3 = COLORS.neon
        content.Size = UDim2.new(1, 0, 1, -124)
        content.Position = UDim2.new(0, 0, 0, 96)
        content.CanvasSize = UDim2.new(0, 0, 0, 0)
        content.AutomaticCanvasSize = Enum.AutomaticSize.Y
        content.ScrollingDirection = Enum.ScrollingDirection.Y
        content.ClipsDescendants = false
        content.Parent = panel

        local cPadding = Instance.new("UIPadding")
        cPadding.PaddingLeft = UDim.new(0, 12)
        cPadding.PaddingRight = UDim.new(0, 12)
        cPadding.PaddingTop = UDim.new(0, 8)
        cPadding.PaddingBottom = UDim.new(0, 12)
        cPadding.Parent = content

        local cLayout = Instance.new("UIListLayout")
        cLayout.Padding = UDim.new(0, 8)
        cLayout.Parent = content

        local footer = Instance.new("Frame")
        footer.BackgroundColor3 = COLORS.panel2
        footer.BorderSizePixel = 0
        footer.Size = UDim2.new(1, 0, 0, 28)
        footer.Position = UDim2.new(0, 0, 1, -28)
        footer.Parent = panel

        local vText = Instance.new("TextLabel")
        vText.BackgroundTransparency = 1
        vText.Text = HACK_NAME .. " (c) 2026"
        vText.TextColor3 = COLORS.muted
        vText.Font = FONT
        vText.TextSize = 10
        vText.Size = UDim2.new(1, -20, 1, 0)
        vText.Position = UDim2.new(0, 10, 0, 0)
        vText.TextXAlignment = Enum.TextXAlignment.Right
        vText.Parent = footer

        -- API TẠO TAB
        local views, tabButtons = {}, {}
        local currentTabName = ""
        local isFirstTab = true

        function Library:CreateTab(name)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 80, 1, 0)
            btn.BackgroundColor3 = COLORS.panel2
            btn.BackgroundTransparency = 1
            btn.Text = name:upper()
            btn.TextColor3 = COLORS.muted
            btn.Font = FONT
            btn.TextSize = 10
            btn.AutoButtonColor = false
            btn.Parent = tabsScroll

            local view = Instance.new("Frame")
            view.Size = UDim2.new(1, 0, 0, 0)
            view.AutomaticSize = Enum.AutomaticSize.Y
            view.BackgroundTransparency = 1
            view.Visible = false
            view.Position = UDim2.new(0, 0, 0, 0)
            view.Parent = content

            views[name] = view
            tabButtons[name] = btn

            btn.MouseButton1Click:Connect(function()
                if currentTabName == name then return end
                local prevView = views[currentTabName]
                if prevView and prevView.Visible then prevView.Visible = false end
                
                for n, b in pairs(tabButtons) do
                    local isActive = (n == name)
                    TweenService:Create(b, TWEEN_SMOOTH, { 
                        TextColor3 = isActive and COLORS.neon or COLORS.muted, 
                        BackgroundTransparency = isActive and 0.9 or 1 
                    }):Play()
                    views[n].Visible = isActive
                end
                currentTabName = name
                view.Position = UDim2.new(0, 0, 0, 15)
                view.Visible = true
                TweenService:Create(view, TWEEN_SMOOTH, { Position = UDim2.new(0, 0, 0, 0) }):Play()
            end)

            if isFirstTab then
                isFirstTab = false
                currentTabName = name
                btn.TextColor3 = COLORS.neon
                btn.BackgroundTransparency = 0.9
                view.Visible = true
                view.Position = UDim2.new(0, 0, 0, 0)
            end
            return view
        end

        function Library:CreateSection(parentTab, text)
            local section = Instance.new("Frame")
            section.Size = UDim2.new(1, 0, 0, 24)
            section.BackgroundTransparency = 1
            section.Parent = parentTab

            local lbl = Instance.new("TextLabel")
            lbl.BackgroundTransparency = 1
            lbl.Size = UDim2.new(1, 0, 1, 0)
            lbl.Text = text:upper()
            lbl.TextColor3 = COLORS.neon
            lbl.Font = FONT
            lbl.TextSize = 11
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Parent = section
            return section
        end

        local function makeRow(parent, label, desc, h)
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, 0, 0, h or 52)
            row.BackgroundColor3 = COLORS.panel2
            row.BorderSizePixel = 0
            row.Parent = parent
            corner(row, 8)
            stroke(row, COLORS.line, 1, 0)

            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1, -70, 0, 20)
            lbl.Position = UDim2.fromOffset(12, 8)
            lbl.BackgroundTransparency = 1
            lbl.Text = label
            lbl.TextColor3 = COLORS.text
            lbl.Font = FONT
            lbl.TextSize = 13
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.Parent = row

            if desc then
                local dsc = Instance.new("TextLabel")
                dsc.Size = UDim2.new(1, -70, 0, 14)
                dsc.Position = UDim2.fromOffset(12, 28)
                dsc.BackgroundTransparency = 1
                dsc.Text = desc
                dsc.TextColor3 = COLORS.muted
                dsc.Font = FONT
                dsc.TextSize = 10
                dsc.TextXAlignment = Enum.TextXAlignment.Left
                dsc.Parent = row
            end
            return row
        end

        function Library:CreateToggle(parentTab, label, desc, default, callback)
            local row = makeRow(parentTab, label, desc)
            local toggle = Instance.new("TextButton")
            toggle.Size = UDim2.fromOffset(42, 22)
            toggle.AnchorPoint = Vector2.new(1, 0.5)
            toggle.Position = UDim2.new(1, -12, 0.5, 0)
            toggle.BackgroundColor3 = COLORS.line
            toggle.Text = ""
            toggle.AutoButtonColor = false
            toggle.Parent = row
            corner(toggle, 11)

            local knob = Instance.new("Frame")
            knob.Size = UDim2.fromOffset(14, 14)
            knob.Position = UDim2.fromOffset(4, 4)
            knob.BackgroundColor3 = COLORS.muted
            knob.BorderSizePixel = 0
            knob.Parent = toggle
            corner(knob, 7)

            local state = default or false
            local function update()
                TweenService:Create(toggle, TWEEN_SMOOTH, { BackgroundColor3 = state and COLORS.neon or COLORS.line }):Play()
                TweenService:Create(knob, TWEEN_BOUNCE, { 
                    Position = state and UDim2.new(1, -18, 0, 4) or UDim2.fromOffset(4, 4), 
                    BackgroundColor3 = state and COLORS.bg or COLORS.muted 
                }):Play()
                if callback then callback(state) end
            end
            toggle.MouseButton1Click:Connect(function()
                state = not state
                update()
            end)
            if default then update() end
            return row
        end

        function Library:CreateButton(parentTab, text, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 36)
            btn.BackgroundColor3 = COLORS.neon
            btn.BackgroundTransparency = 0.85
            btn.Text = text:upper()
            btn.TextColor3 = COLORS.neon
            btn.Font = FONT
            btn.TextSize = 11
            btn.AutoButtonColor = false
            btn.Parent = parentTab
            corner(btn, 6)
            local bStroke = stroke(btn, COLORS.neon, 1, 0.5)

            btn.MouseButton1Down:Connect(function()
                TweenService:Create(btn, TWEEN_FADE, { Size = UDim2.new(0.95, 0, 0, 32), BackgroundTransparency = 0.6 }):Play()
                TweenService:Create(bStroke, TWEEN_FADE, { Transparency = 0.1 }):Play()
            end)
            btn.MouseButton1Up:Connect(function()
                TweenService:Create(btn, TWEEN_FADE, { Size = UDim2.new(1, 0, 0, 36), BackgroundTransparency = 0.85 }):Play()
                TweenService:Create(bStroke, TWEEN_FADE, { Transparency = 0.5 }):Play()
            end)
            btn.MouseButton1Click:Connect(callback)
            return btn
        end

        function Library:CreateSlider(parentTab, label, min, max, default, callback)
            local row = makeRow(parentTab, label, nil, 48)
            local valLbl = Instance.new("TextLabel")
            valLbl.Size = UDim2.new(0, 40, 0, 20)
            valLbl.Position = UDim2.new(1, -50, 0, 8)
            valLbl.BackgroundTransparency = 1
            valLbl.Text = tostring(default)
            valLbl.TextColor3 = COLORS.neon
            valLbl.Font = FONT
            valLbl.TextSize = 12
            valLbl.TextXAlignment = Enum.TextXAlignment.Right
            valLbl.Parent = row

            local barBg = Instance.new("Frame")
            barBg.Size = UDim2.new(1, -24, 0, 4)
            barBg.Position = UDim2.new(0, 12, 1, -12)
            barBg.BackgroundColor3 = COLORS.line
            barBg.BorderSizePixel = 0
            barBg.Parent = row
            corner(barBg, 2)

            local fill = Instance.new("Frame")
            fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            fill.BackgroundColor3 = COLORS.neon
            fill.BorderSizePixel = 0
            fill.Parent = barBg
            corner(fill, 2)

            local slideArea = Instance.new("TextButton")
            slideArea.Size = UDim2.new(1, -24, 0, 20)
            slideArea.Position = UDim2.new(0, 12, 1, -20)
            slideArea.BackgroundTransparency = 1
            slideArea.Text = ""
            slideArea.Parent = row

            local dragging = false
            slideArea.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
            slideArea.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            slideArea.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local percent = math.clamp((input.Position.X - slideArea.AbsolutePosition.X) / slideArea.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + ((max - min) * percent) + 0.5)
                    fill.Size = UDim2.new(percent, 0, 1, 0)
                    valLbl.Text = tostring(value)
                    if callback then callback(value) end
                end
            end)
            return row
        end

        function Library:CreateTextBox(parentTab, label, default, callback)
            local row = makeRow(parentTab, label, nil, 52)
            local box = Instance.new("TextBox")
            box.Size = UDim2.new(1, -24, 0, 24)
            box.Position = UDim2.new(0, 12, 1, -32)
            box.BackgroundColor3 = COLORS.panel
            box.TextColor3 = COLORS.text
            box.PlaceholderText = "Nhập..."
            box.Text = default or ""
            box.Font = FONT
            box.TextSize = 11
            box.ClearTextOnFocus = false
            box.Parent = row
            corner(box, 4)
            stroke(box, COLORS.line, 1, 0)

            box.FocusLost:Connect(function()
                if callback then callback(box.Text) end
            end)
            return row
        end

        function Library:CreateDropdown(parentTab, label, list, callback)
            local row = makeRow(parentTab, label, nil, 52)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 100, 0, 24)
            btn.Position = UDim2.new(1, -112, 0.5, 0)
            btn.AnchorPoint = Vector2.new(0, 0.5)
            btn.BackgroundColor3 = COLORS.panel
            btn.Text = "Chọn..."
            btn.TextColor3 = COLORS.neon
            btn.Font = FONT
            btn.TextSize = 11
            btn.Parent = row
            corner(btn, 4)
            stroke(btn, COLORS.neon, 1, 0.5)

            local isDropped = false
            local dropFrame = Instance.new("Frame")
            dropFrame.Size = UDim2.new(0, 100, 0, 0)
            dropFrame.Position = UDim2.new(1, -112, 1, 4)
            dropFrame.BackgroundColor3 = COLORS.panel2
            dropFrame.Visible = false
            dropFrame.ZIndex = 10
            dropFrame.Parent = row
            corner(dropFrame, 4)
            stroke(dropFrame, COLORS.line, 1, 0)
            local dropLayout = Instance.new("UIListLayout")
            dropLayout.Parent = dropFrame

            for i, v in ipairs(list) do
                local opt = Instance.new("TextButton")
                opt.Size = UDim2.new(1, 0, 0, 24)
                opt.BackgroundTransparency = 1
                opt.Text = tostring(v)
                opt.TextColor3 = COLORS.text
                opt.Font = FONT
                opt.TextSize = 11
                opt.ZIndex = 11
                opt.Parent = dropFrame
                opt.MouseButton1Click:Connect(function()
                    btn.Text = tostring(v)
                    dropFrame.Visible = false
                    dropFrame.Size = UDim2.new(0, 100, 0, 0)
                    if callback then callback(v) end
                end)
            end

            btn.MouseButton1Click:Connect(function()
                isDropped = not isDropped
                if isDropped then
                    dropFrame.Visible = true
                    dropFrame.Size = UDim2.new(0, 100, 0, #list * 24)
                else
                    dropFrame.Visible = false
                    dropFrame.Size = UDim2.new(0, 100, 0, 0)
                end
            end)
            return row
        end

        local isOpen = false
        Library.SetPanel = function(_, open)
            if isOpen == open then return end
            isOpen = open
            if open then
                panel.Visible = true
                local vp = workspace.CurrentCamera.ViewportSize
                local pX = launcher.Position.X
                local pY = launcher.Position.Y.Scale + (launcher.Size.Y.Offset / vp.Y) + 0.015
                panel.Position = UDim2.new(pX.Scale, pX.Offset, pY, 0)
                
                local targetWidth = math.min(350, vp.X - 30)
                local targetHeight = math.min(480, vp.Y - (vp.Y * pY) - 50)

                local actualPX = (vp.X * panel.Position.X.Scale) + panel.Position.X.Offset
                if actualPX - targetWidth/2 < 15 then
                    panel.Position = UDim2.new(0, targetWidth/2 + 15, pY, 0)
                elseif actualPX + targetWidth/2 > vp.X - 15 then
                    panel.Position = UDim2.new(0, vp.X - targetWidth/2 - 15, pY, 0)
                end

                panel.Size = UDim2.new(0, targetWidth, 0, 0)
                panel.BackgroundTransparency = 1
                
                TweenService:Create(panel, TWEEN_BOUNCE, { 
                    Size = UDim2.fromOffset(targetWidth, targetHeight),
                    BackgroundTransparency = 0
                }):Play()
            else
                local targetWidth = panel.Size.X.Offset
                local closeTween = TweenService:Create(panel, TWEEN_SMOOTH, { 
                    Size = UDim2.new(0, targetWidth, 0, 0),
                    BackgroundTransparency = 1
                })
                closeTween:Play()
                closeTween.Completed:Connect(function()
                    if not isOpen then panel.Visible = false end
                end)
            end
        end

        launcher.MouseButton1Click:Connect(function() Library:SetPanel(not isOpen) end)
        closeBtn.MouseButton1Click:Connect(function() Library:SetPanel(false) end)

        task.spawn(function()
            while screenGui.Parent do
                if title.Text ~= HACK_NAME then title.Text = HACK_NAME end
                if lTitle.Text ~= HACK_NAME then lTitle.Text = HACK_NAME end
                if vText.Text ~= HACK_NAME .. " (c) 2026" then vText.Text = HACK_NAME .. " (c) 2026" end
                task.wait(0.5)
            end
        end)
        
        local function makeDraggable(frame, dragTarget)
            local dragging, dragInput, dragStart, startPos
            dragTarget.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragStart = input.Position
                    startPos = frame.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then dragging = false end
                    end)
                end
            end)
            dragTarget.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    local delta = input.Position - dragStart
                    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
        end
        makeDraggable(panel, header)
    end)
    if not success then warn("[CuTins Init Error]: " .. tostring(err)) end
end
return Library