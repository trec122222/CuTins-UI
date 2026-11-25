local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local CuTinsUI = {}
CuTinsUI.__index = CuTinsUI

local Theme = {
    Background = Color3.fromRGB(16, 16, 22),
    Sidebar = Color3.fromRGB(22, 22, 30),
    Element = Color3.fromRGB(28, 28, 38),
    ElementHover = Color3.fromRGB(36, 36, 48),
    Accent = Color3.fromRGB(145, 70, 255),
    AccentGlow = Color3.fromRGB(185, 130, 255),
    TextPrimary = Color3.fromRGB(245, 245, 250),
    TextSecondary = Color3.fromRGB(160, 160, 175),
    Border = Color3.fromRGB(55, 55, 75),
    Success = Color3.fromRGB(65, 210, 130),
    Warning = Color3.fromRGB(255, 180, 60)
}

-- Tiện ích tạo Instance nhanh
local function Create(className, props, children)
    local inst = Instance.new(className)
    for k, v in pairs(props or {}) do
        inst[k] = v
    end
    for _, child in ipairs(children or {}) do
        child.Parent = inst
    end
    return inst
end

-- Tiện ích Tween nhanh
local function Tween(inst, duration, props, style, dir)
    local info = TweenInfo.new(
        duration or 0.2,
        style or Enum.EasingStyle.Quart,
        dir or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(inst, info, props)
    tween:Play()
    return tween
end

-- Kéo thả mượt cho khung chính
local function MakeDraggable(topBar, mainFrame)
    local dragging, dragInput, dragStart, startPos

    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    topBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Tween(mainFrame, 0.08, {
                Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            }, Enum.EasingStyle.Sine)
        end
    end)
end

function CuTinsUI:CreateWindow(config)
    config = config or {}
    local TitleText = config.Title or "CuTins UI"
    local SubtitleText = config.Subtitle or "v2.0"
    local ToggleKey = config.ToggleKey or Enum.KeyCode.RightShift
    if config.AccentColor then
        Theme.Accent = config.AccentColor
    end

    -- Xóa UI cũ nếu trùng tên
    local parentTarget = (pcall(function() return CoreGui.Name end) and CoreGui) or LocalPlayer:WaitForChild("PlayerGui")
    if parentTarget:FindFirstChild("CuTinsUI_Screen") then
        parentTarget:FindFirstChild("CuTinsUI_Screen"):Destroy()
    end

    local ScreenGui = Create("ScreenGui", {
        Name = "CuTinsUI_Screen",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = parentTarget
    })

    -- Container cho Toast Notifications
    local NotifyHolder = Create("Frame", {
        Name = "NotifyHolder",
        Size = UDim2.new(0, 280, 1, -20),
        Position = UDim2.new(1, -295, 0, 10),
        BackgroundTransparency = 1,
        Parent = ScreenGui
    }, {
        Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            Padding = UDim.new(0, 8)
        })
    })

    -- Khung cửa sổ chính
    local MainFrame = Create("Frame", {
        Name = "MainFrame",
        Size = UDim2.new(0, 560, 0, 380),
        Position = UDim2.new(0.5, -280, 0.5, -190),
        BackgroundColor3 = Theme.Background,
        BackgroundTransparency = 0.06,
        ClipsDescendants = true,
        Parent = ScreenGui
    }, {
        Create("UICorner", { CornerRadius = UDim.new(0, 12) }),
        Create("UIStroke", {
            Color = Theme.Accent,
            Thickness = 1.4,
            Transparency = 0.35
        })
    })

    -- Thanh tiêu đề (Topbar)
    local TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = Theme.Sidebar,
        BackgroundTransparency = 0.1,
        Parent = MainFrame
    }, {
        Create("UICorner", { CornerRadius = UDim.new(0, 12) }),
        Create("Frame", { -- Che góc bo phía dưới TopBar
            Size = UDim2.new(1, 0, 0, 10),
            Position = UDim2.new(0, 0, 1, -10),
            BackgroundColor3 = Theme.Sidebar,
            BackgroundTransparency = 0.1,
            BorderSizePixel = 0
        }),
        Create("TextLabel", {
            Text = TitleText,
            Font = Enum.Font.GothamBold,
            TextSize = 16,
            TextColor3 = Theme.TextPrimary,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 16, 0, 0),
            Size = UDim2.new(0, 200, 1, 0)
        }),
        Create("TextLabel", {
            Text = SubtitleText,
            Font = Enum.Font.GothamMedium,
            TextSize = 11,
            TextColor3 = Theme.AccentGlow,
            BackgroundColor3 = Theme.Element,
            Position = UDim2.new(0, 115, 0.5, -10),
            Size = UDim2.new(0, 44, 0, 20)
        }, {
            Create("UICorner", { CornerRadius = UDim.new(0, 6) })
        })
    })

    -- Nút thu gọn (Minimize) & Đóng (Close)
    local Minimized = false
    local MinBtn = Create("TextButton", {
        Text = "—",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = Theme.TextSecondary,
        BackgroundColor3 = Theme.Element,
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(1, -72, 0.5, -14),
        AutoButtonColor = false,
        Parent = TopBar
    }, {
        Create("UICorner", { CornerRadius = UDim.new(0, 6) })
    })

    local CloseBtn = Create("TextButton", {
        Text = "×",
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextColor3 = Theme.TextSecondary,
        BackgroundColor3 = Theme.Element,
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(1, -38, 0.5, -14),
        AutoButtonColor = false,
        Parent = TopBar
    }, {
        Create("UICorner", { CornerRadius = UDim.new(0, 6) })
    })

    MinBtn.MouseButton1Click:Connect(function()
        Minimized = not Minimized
        Tween(MainFrame, 0.25, {
            Size = Minimized and UDim2.new(0, 560, 0, 44) or UDim2.new(0, 560, 0, 380)
        })
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Phím tắt ẩn/hiện toàn bộ UI
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == ToggleKey then
            MainFrame.Visible = not MainFrame.Visible
        end
    end)

    MakeDraggable(TopBar, MainFrame)

    -- Sidebar chứa danh sách Tabs
    local Sidebar = Create("ScrollingFrame", {
        Name = "Sidebar",
        Size = UDim2.new(0, 145, 1, -54),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundColor3 = Theme.Sidebar,
        BackgroundTransparency = 0.25,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = MainFrame
    }, {
        Create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        Create("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 6),
            PaddingRight = UDim.new(0, 6)
        }),
        Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 6)
        })
    })

    -- Vùng nội dung chính bên phải
    local ContentArea = Create("Frame", {
        Name = "ContentArea",
        Size = UDim2.new(1, -172, 1, -54),
        Position = UDim2.new(0, 162, 0, 50),
        BackgroundTransparency = 1,
        Parent = MainFrame
    })

    local WindowObj = {
        Tabs = {},
        FirstTab = true
    }

    -- Hàm gửi thông báo nổi (Toast Notification)
    function WindowObj:Notify(opts)
        opts = opts or {}
        local nTitle = opts.Title or "Thông báo"
        local nText = opts.Content or ""
        local duration = opts.Duration or 3

        local Card = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 62),
            BackgroundColor3 = Theme.Sidebar,
            BackgroundTransparency = 0.05,
            ClipsDescendants = true,
            Parent = NotifyHolder
        }, {
            Create("UICorner", { CornerRadius = UDim.new(0, 8) }),
            Create("UIStroke", { Color = Theme.Accent, Thickness = 1, Transparency = 0.4 }),
            Create("TextLabel", {
                Text = nTitle,
                Font = Enum.Font.GothamBold,
                TextSize = 13,
                TextColor3 = Theme.AccentGlow,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 8),
                Size = UDim2.new(1, -24, 0, 18)
            }),
            Create("TextLabel", {
                Text = nText,
                Font = Enum.Font.Gotham,
                TextSize = 12,
                TextColor3 = Theme.TextPrimary,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 12, 0, 26),
                Size = UDim2.new(1, -24, 0, 28)
            })
        })

        local Progress = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 2),
            Position = UDim2.new(0, 0, 1, -2),
            BackgroundColor3 = Theme.Accent,
            BorderSizePixel = 0,
            Parent = Card
        })

        Tween(Progress, duration, { Size = UDim2.new(0, 0, 0, 2) }, Enum.EasingStyle.Linear)
        task.delay(duration, function()
            if Card and Card.Parent then
                Tween(Card, 0.25, { BackgroundTransparency = 1 })
                task.wait(0.25)
                Card:Destroy()
            end
        end)
    end

    -- Tạo Tab mới
    function WindowObj:CreateTab(tabName)
        local TabBtn = Create("TextButton", {
            Text = tabName,
            Font = Enum.Font.GothamMedium,
            TextSize = 13,
            TextColor3 = Theme.TextSecondary,
            BackgroundColor3 = Theme.Element,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 32),
            AutoButtonColor = false,
            Parent = Sidebar
        }, {
            Create("UICorner", { CornerRadius = UDim.new(0, 6) })
        })

        local Indicator = Create("Frame", {
            Size = UDim2.new(0, 3, 0, 16),
            Position = UDim2.new(0, 0, 0.5, -8),
            BackgroundColor3 = Theme.Accent,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Parent = TabBtn
        }, {
            Create("UICorner", { CornerRadius = UDim.new(1, 0) })
        })

        local Page = Create("ScrollingFrame", {
            Name = tabName .. "_Page",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = Theme.Accent,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Visible = false,
            Parent = ContentArea
        }, {
            Create("UIPadding", {
                PaddingRight = UDim.new(0, 6),
                PaddingBottom = UDim.new(0, 8)
            }),
            Create("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            })
        })

        local function ActivateTab()
            for _, t in ipairs(WindowObj.Tabs) do
                t.Page.Visible = false
                Tween(t.Btn, 0.2, { BackgroundTransparency = 1, TextColor3 = Theme.TextSecondary })
                Tween(t.Indicator, 0.2, { BackgroundTransparency = 1 })
            end
            Page.Visible = true
            Tween(TabBtn, 0.2, { BackgroundTransparency = 0.2, TextColor3 = Theme.TextPrimary })
            Tween(Indicator, 0.2, { BackgroundTransparency = 0 })
        end

        TabBtn.MouseButton1Click:Connect(ActivateTab)
        table.insert(WindowObj.Tabs, { Btn = TabBtn, Page = Page, Indicator = Indicator })

        if WindowObj.FirstTab then
            WindowObj.FirstTab = false
            ActivateTab()
        end

        local TabElements = {}

        -- 1. Section Header
        function TabElements:AddSection(text)
            Create("TextLabel", {
                Text = string.upper(text),
                Font = Enum.Font.GothamBold,
                TextSize = 11,
                TextColor3 = Theme.AccentGlow,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 20),
                Parent = Page
            })
        end

        -- 2. Button
        function TabElements:AddButton(opts)
            local Btn = Create("TextButton", {
                Text = "",
                BackgroundColor3 = Theme.Element,
                Size = UDim2.new(1, 0, 0, 36),
                AutoButtonColor = false,
                Parent = Page
            }, {
                Create("UICorner", { CornerRadius = UDim.new(0, 8) }),
                Create("UIStroke", { Color = Theme.Border, Thickness = 1, Transparency = 0.5 }),
                Create("TextLabel", {
                    Text = opts.Name or "Button",
                    Font = Enum.Font.GothamMedium,
                    TextSize = 13,
                    TextColor3 = Theme.TextPrimary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 0),
                    Size = UDim2.new(1, -24, 1, 0)
                })
            })

            Btn.MouseEnter:Connect(function()
                Tween(Btn, 0.15, { BackgroundColor3 = Theme.ElementHover })
            end)
            Btn.MouseLeave:Connect(function()
                Tween(Btn, 0.15, { BackgroundColor3 = Theme.Element })
            end)
            Btn.MouseButton1Click:Connect(function()
                Tween(Btn, 0.08, { BackgroundColor3 = Theme.Accent })
                task.wait(0.08)
                Tween(Btn, 0.15, { BackgroundColor3 = Theme.ElementHover })
                if opts.Callback then opts.Callback() end
            end)
        end

        -- 3. Toggle
        function TabElements:AddToggle(opts)
            local State = opts.Default or false
            local Row = Create("TextButton", {
                Text = "",
                BackgroundColor3 = Theme.Element,
                Size = UDim2.new(1, 0, 0, 36),
                AutoButtonColor = false,
                Parent = Page
            }, {
                Create("UICorner", { CornerRadius = UDim.new(0, 8) }),
                Create("UIStroke", { Color = Theme.Border, Thickness = 1, Transparency = 0.5 }),
                Create("TextLabel", {
                    Text = opts.Name or "Toggle",
                    Font = Enum.Font.GothamMedium,
                    TextSize = 13,
                    TextColor3 = Theme.TextPrimary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 0),
                    Size = UDim2.new(1, -65, 1, 0)
                })
            })

            local SwitchBg = Create("Frame", {
                Size = UDim2.new(0, 38, 0, 20),
                Position = UDim2.new(1, -50, 0.5, -10),
                BackgroundColor3 = State and Theme.Accent or Theme.Sidebar,
                Parent = Row
            }, {
                Create("UICorner", { CornerRadius = UDim.new(1, 0) })
            })

            local Knob = Create("Frame", {
                Size = UDim2.new(0, 14, 0, 14),
                Position = State and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
                BackgroundColor3 = Theme.TextPrimary,
                Parent = SwitchBg
            }, {
                Create("UICorner", { CornerRadius = UDim.new(1, 0) })
            })

            local function SetState(val)
                State = val
                Tween(SwitchBg, 0.2, { BackgroundColor3 = State and Theme.Accent or Theme.Sidebar })
                Tween(Knob, 0.2, { Position = State and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7) })
                if opts.Callback then opts.Callback(State) end
            end

            Row.MouseButton1Click:Connect(function()
                SetState(not State)
            end)

            return { Set = SetState }
        end

        -- 4. Slider
        function TabElements:AddSlider(opts)
            local Min = opts.Min or 0
            local Max = opts.Max or 100
            local Value = math.clamp(opts.Default or Min, Min, Max)
            local Suffix = opts.Suffix or ""

            local Box = Create("Frame", {
                BackgroundColor3 = Theme.Element,
                Size = UDim2.new(1, 0, 0, 50),
                Parent = Page
            }, {
                Create("UICorner", { CornerRadius = UDim.new(0, 8) }),
                Create("UIStroke", { Color = Theme.Border, Thickness = 1, Transparency = 0.5 }),
                Create("TextLabel", {
                    Text = opts.Name or "Slider",
                    Font = Enum.Font.GothamMedium,
                    TextSize = 13,
                    TextColor3 = Theme.TextPrimary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 6),
                    Size = UDim2.new(1, -80, 0, 18)
                })
            })

            local ValLabel = Create("TextLabel", {
                Text = tostring(Value) .. Suffix,
                Font = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = Theme.AccentGlow,
                TextXAlignment = Enum.TextXAlignment.Right,
                BackgroundTransparency = 1,
                Position = UDim2.new(1, -72, 0, 6),
                Size = UDim2.new(0, 60, 0, 18),
                Parent = Box
            })

            local Track = Create("Frame", {
                Size = UDim2.new(1, -24, 0, 6),
                Position = UDim2.new(0, 12, 0, 34),
                BackgroundColor3 = Theme.Sidebar,
                Parent = Box
            }, {
                Create("UICorner", { CornerRadius = UDim.new(1, 0) })
            })

            local Fill = Create("Frame", {
                Size = UDim2.new((Value - Min) / (Max - Min), 0, 1, 0),
                BackgroundColor3 = Theme.Accent,
                Parent = Track
            }, {
                Create("UICorner", { CornerRadius = UDim.new(1, 0) })
            })

            local Sliding = false
            local function UpdateFromInput(input)
                local pct = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
                Value = math.floor(Min + (Max - Min) * pct + 0.5)
                ValLabel.Text = tostring(Value) .. Suffix
                Tween(Fill, 0.06, { Size = UDim2.new(pct, 0, 1, 0) })
                if opts.Callback then opts.Callback(Value) end
            end

            Track.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = true
                    UpdateFromInput(input)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding = false
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if Sliding and input.UserInputType == Enum.UserInputType.MouseMovement then
                    UpdateFromInput(input)
                end
            end)
        end

        -- 5. Dropdown
        function TabElements:AddDropdown(opts)
            local Items = opts.Options or {}
            local Selected = opts.Default or Items[1] or "Chọn..."
            local Open = false

            local Container = Create("Frame", {
                BackgroundColor3 = Theme.Element,
                Size = UDim2.new(1, 0, 0, 36),
                ClipsDescendants = true,
                Parent = Page
            }, {
                Create("UICorner", { CornerRadius = UDim.new(0, 8) }),
                Create("UIStroke", { Color = Theme.Border, Thickness = 1, Transparency = 0.5 })
            })

            local HeaderBtn = Create("TextButton", {
                Text = "",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 36),
                Parent = Container
            }, {
                Create("TextLabel", {
                    Text = opts.Name or "Dropdown",
                    Font = Enum.Font.GothamMedium,
                    TextSize = 13,
                    TextColor3 = Theme.TextPrimary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 0),
                    Size = UDim2.new(0.5, 0, 1, 0)
                })
            })

            local SelectedLabel = Create("TextLabel", {
                Text = Selected .. "  ▼",
                Font = Enum.Font.Gotham,
                TextSize = 12,
                TextColor3 = Theme.AccentGlow,
                TextXAlignment = Enum.TextXAlignment.Right,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.5, -12, 0, 0),
                Size = UDim2.new(0.5, 0, 1, 0),
                Parent = HeaderBtn
            })

            local ListFrame = Create("Frame", {
                Position = UDim2.new(0, 8, 0, 38),
                Size = UDim2.new(1, -16, 0, #Items * 28),
                BackgroundTransparency = 1,
                Parent = Container
            }, {
                Create("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                })
            })

            for _, item in ipairs(Items) do
                local OptBtn = Create("TextButton", {
                    Text = tostring(item),
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    TextColor3 = Theme.TextSecondary,
                    BackgroundColor3 = Theme.Sidebar,
                    Size = UDim2.new(1, 0, 0, 24),
                    AutoButtonColor = false,
                    Parent = ListFrame
                }, {
                    Create("UICorner", { CornerRadius = UDim.new(0, 6) })
                })

                OptBtn.MouseButton1Click:Connect(function()
                    Selected = tostring(item)
                    SelectedLabel.Text = Selected .. "  ▼"
                    Open = false
                    Tween(Container, 0.2, { Size = UDim2.new(1, 0, 0, 36) })
                    if opts.Callback then opts.Callback(item) end
                end)
            end

            HeaderBtn.MouseButton1Click:Connect(function()
                Open = not Open
                local targetH = Open and (42 + #Items * 28) or 36
                SelectedLabel.Text = Selected .. (Open and "  ▲" or "  ▼")
                Tween(Container, 0.2, { Size = UDim2.new(1, 0, 0, targetH) })
            end)
        end

        -- 6. Keybind Picker
        function TabElements:AddKeybind(opts)
            local CurrentKey = opts.Default or Enum.KeyCode.F
            local Listening = false

            local Row = Create("Frame", {
                BackgroundColor3 = Theme.Element,
                Size = UDim2.new(1, 0, 0, 36),
                Parent = Page
            }, {
                Create("UICorner", { CornerRadius = UDim.new(0, 8) }),
                Create("UIStroke", { Color = Theme.Border, Thickness = 1, Transparency = 0.5 }),
                Create("TextLabel", {
                    Text = opts.Name or "Keybind",
                    Font = Enum.Font.GothamMedium,
                    TextSize = 13,
                    TextColor3 = Theme.TextPrimary,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 12, 0, 0),
                    Size = UDim2.new(1, -90, 1, 0)
                })
            })

            local BindBtn = Create("TextButton", {
                Text = CurrentKey.Name,
                Font = Enum.Font.GothamBold,
                TextSize = 11,
                TextColor3 = Theme.AccentGlow,
                BackgroundColor3 = Theme.Sidebar,
                Size = UDim2.new(0, 72, 0, 24),
                Position = UDim2.new(1, -82, 0.5, -12),
                AutoButtonColor = false,
                Parent = Row
            }, {
                Create("UICorner", { CornerRadius = UDim.new(0, 6) })
            })

            BindBtn.MouseButton1Click:Connect(function()
                Listening = true
                BindBtn.Text = "..."
            end)

            UserInputService.InputBegan:Connect(function(input, gp)
                if Listening and input.UserInputType == Enum.UserInputType.Keyboard then
                    Listening = false
                    CurrentKey = input.KeyCode
                    BindBtn.Text = CurrentKey.Name
                elseif not gp and input.KeyCode == CurrentKey then
                    if opts.Callback then opts.Callback(CurrentKey) end
                end
            end)
        end

        return TabElements
    end

    return WindowObj
end

return CuTinsUI
