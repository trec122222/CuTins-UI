local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local UserInputService = game:GetService("UserInputService");
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local Library = {};
local COLORS = {bg=Color3.fromRGB(8, 14, 15),panel=Color3.fromRGB(12, 22, 24),panel2=Color3.fromRGB(18, 32, 35),line=Color3.fromRGB(30, 52, 56),neon=Color3.fromRGB(0, 255, 198),danger=Color3.fromRGB(255, 59, 92),text=Color3.fromRGB(200, 247, 239),muted=Color3.fromRGB(95, 139, 134)};
local FONT = Enum.Font.Code;
local TWEEN_SMOOTH = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local TWEEN_BOUNCE = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
local TWEEN_FADE = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local function corner(parent, r)
	local FlatIdent_7126A = 0;
	local c;
	while true do
		if (FlatIdent_7126A == 1) then
			c.Parent = parent;
			return c;
		end
		if (FlatIdent_7126A == 0) then
			c = Instance.new("UICorner");
			c.CornerRadius = UDim.new(0, r);
			FlatIdent_7126A = 1;
		end
	end
end
local function stroke(parent, color, thickness, transparency)
	local FlatIdent_2661B = 0;
	local s;
	while true do
		if (FlatIdent_2661B == 1) then
			s.Thickness = thickness or 1;
			s.Transparency = transparency or 0;
			FlatIdent_2661B = 2;
		end
		if (FlatIdent_2661B == 2) then
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			s.Parent = parent;
			FlatIdent_2661B = 3;
		end
		if (FlatIdent_2661B == 0) then
			s = Instance.new("UIStroke");
			s.Color = color;
			FlatIdent_2661B = 1;
		end
		if (FlatIdent_2661B == 3) then
			return s;
		end
	end
end
local notifGui = Instance.new("ScreenGui");
notifGui.Name = "CuTinNotifs";
notifGui.ResetOnSpawn = false;
notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
notifGui.Parent = playerGui;
Library.Notify = function(self, title, text)
	local FlatIdent_39B0 = 0;
	local notif;
	local t1;
	local t2;
	while true do
		if (FlatIdent_39B0 == 2) then
			t1.BackgroundTransparency = 1;
			t1.Size = UDim2.new(1, -20, 0, 20);
			t1.Position = UDim2.fromOffset(10, 8);
			t1.Text = title;
			FlatIdent_39B0 = 3;
		end
		if (3 == FlatIdent_39B0) then
			t1.TextColor3 = COLORS.neon;
			t1.Font = FONT;
			t1.TextSize = 14;
			t1.TextXAlignment = Enum.TextXAlignment.Left;
			FlatIdent_39B0 = 4;
		end
		if (FlatIdent_39B0 == 5) then
			t2.Position = UDim2.fromOffset(10, 30);
			t2.Text = text;
			t2.TextColor3 = COLORS.text;
			t2.Font = FONT;
			FlatIdent_39B0 = 6;
		end
		if (4 == FlatIdent_39B0) then
			t1.Parent = notif;
			t2 = Instance.new("TextLabel");
			t2.BackgroundTransparency = 1;
			t2.Size = UDim2.new(1, -20, 0, 20);
			FlatIdent_39B0 = 5;
		end
		if (FlatIdent_39B0 == 1) then
			notif.Parent = notifGui;
			corner(notif, 8);
			stroke(notif, COLORS.neon, 1, 0.5);
			t1 = Instance.new("TextLabel");
			FlatIdent_39B0 = 2;
		end
		if (FlatIdent_39B0 == 7) then
			task.delay(3, function()
				local FlatIdent_2FD19 = 0;
				local tween;
				while true do
					if (FlatIdent_2FD19 == 0) then
						tween = TweenService:Create(notif, TWEEN_SMOOTH, {Position=UDim2.new(1, 350, 0.8, 0)});
						tween:Play();
						FlatIdent_2FD19 = 1;
					end
					if (FlatIdent_2FD19 == 1) then
						tween.Completed:Connect(function()
							notif:Destroy();
						end);
						break;
					end
				end
			end);
			break;
		end
		if (FlatIdent_39B0 == 0) then
			notif = Instance.new("Frame");
			notif.Size = UDim2.fromOffset(250, 60);
			notif.Position = UDim2.new(1, 350, 0.8, 0);
			notif.BackgroundColor3 = COLORS.panel;
			FlatIdent_39B0 = 1;
		end
		if (FlatIdent_39B0 == 6) then
			t2.TextSize = 11;
			t2.TextXAlignment = Enum.TextXAlignment.Left;
			t2.Parent = notif;
			TweenService:Create(notif, TWEEN_SMOOTH, {Position=UDim2.new(1, -260, 0.8, 0)}):Play();
			FlatIdent_39B0 = 7;
		end
	end
end;
Library.Init = function(self, config)
	config = config or {};
	local HACK_NAME = "CuTins Hack";
	local GAME_NAME = config.Game or "Roblox Game";
	local screenGui = Instance.new("ScreenGui");
	screenGui.Name = "CuTinHack";
	screenGui.ResetOnSpawn = false;
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	screenGui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets;
	screenGui.IgnoreGuiInset = true;
	screenGui.Parent = playerGui;
	local launcher = Instance.new("TextButton");
	launcher.Name = "Launcher";
	launcher.AnchorPoint = Vector2.new(0.5, 0);
	launcher.Size = UDim2.fromOffset(150, 38);
	launcher.BackgroundColor3 = COLORS.panel;
	launcher.BackgroundTransparency = 0.4;
	launcher.Text = "";
	launcher.AutoButtonColor = false;
	launcher.BorderSizePixel = 0;
	launcher.Position = UDim2.new(0.5, 0, 0.05, 0);
	launcher.Parent = screenGui;
	corner(launcher, 8);
	stroke(launcher, COLORS.neon, 1, 0.4);
	local lTitle = Instance.new("TextLabel");
	lTitle.BackgroundTransparency = 1;
	lTitle.Text = HACK_NAME;
	lTitle.TextColor3 = COLORS.neon;
	lTitle.Font = FONT;
	lTitle.TextSize = 13;
	lTitle.TextXAlignment = Enum.TextXAlignment.Left;
	lTitle.Size = UDim2.new(1, -12, 0, 16);
	lTitle.Position = UDim2.fromOffset(8, 4);
	lTitle.Parent = launcher;
	local lGame = Instance.new("TextLabel");
	lGame.BackgroundTransparency = 1;
	lGame.Text = GAME_NAME;
	lGame.TextColor3 = COLORS.muted;
	lGame.Font = FONT;
	lGame.TextSize = 10;
	lGame.TextXAlignment = Enum.TextXAlignment.Left;
	lGame.Size = UDim2.new(1, -12, 0, 12);
	lGame.Position = UDim2.fromOffset(8, 20);
	lGame.Parent = launcher;
	local panel = Instance.new("Frame");
	panel.Name = "Panel";
	panel.AnchorPoint = Vector2.new(0.5, 0);
	panel.BackgroundColor3 = COLORS.bg;
	panel.BorderSizePixel = 0;
	panel.Visible = false;
	panel.Size = UDim2.fromOffset(0, 0);
	panel.Parent = screenGui;
	corner(panel, 12);
	stroke(panel, COLORS.line, 1, 0);
	local header = Instance.new("Frame");
	header.BackgroundColor3 = COLORS.panel;
	header.BorderSizePixel = 0;
	header.Size = UDim2.new(1, 0, 0, 60);
	header.Parent = panel;
	corner(header, 12);
	local hFix = Instance.new("Frame");
	hFix.BackgroundColor3 = COLORS.panel;
	hFix.BorderSizePixel = 0;
	hFix.Size = UDim2.new(1, 0, 0, 16);
	hFix.Position = UDim2.new(0, 0, 1, -16);
	hFix.Parent = header;
	local title = Instance.new("TextLabel");
	title.BackgroundTransparency = 1;
	title.Text = HACK_NAME;
	title.TextColor3 = COLORS.neon;
	title.Font = FONT;
	title.TextSize = 18;
	title.TextXAlignment = Enum.TextXAlignment.Left;
	title.Size = UDim2.new(1, -60, 0, 20);
	title.Position = UDim2.fromOffset(16, 8);
	title.Parent = header;
	local closeBtn = Instance.new("TextButton");
	closeBtn.Size = UDim2.fromOffset(40, 40);
	closeBtn.Position = UDim2.new(1, -50, 0, 10);
	closeBtn.BackgroundColor3 = COLORS.danger;
	closeBtn.BackgroundTransparency = 0.85;
	closeBtn.Text = "X";
	closeBtn.TextColor3 = COLORS.danger;
	closeBtn.Font = FONT;
	closeBtn.TextSize = 16;
	closeBtn.AutoButtonColor = false;
	closeBtn.Parent = header;
	corner(closeBtn, 8);
	stroke(closeBtn, COLORS.danger, 1, 0.6);
	local tabsScroll = Instance.new("ScrollingFrame");
	tabsScroll.BackgroundColor3 = COLORS.panel2;
	tabsScroll.BorderSizePixel = 0;
	tabsScroll.Size = UDim2.new(1, 0, 0, 36);
	tabsScroll.Position = UDim2.new(0, 0, 0, 60);
	tabsScroll.CanvasSize = UDim2.new(0, 0, 0, 0);
	tabsScroll.AutomaticCanvasSize = Enum.AutomaticSize.X;
	tabsScroll.ScrollingDirection = Enum.ScrollingDirection.X;
	tabsScroll.ScrollBarThickness = 0;
	tabsScroll.Parent = panel;
	local tabsLayout = Instance.new("UIListLayout");
	tabsLayout.FillDirection = Enum.FillDirection.Horizontal;
	tabsLayout.Padding = UDim.new(0, 2);
	tabsLayout.Parent = tabsScroll;
	local content = Instance.new("ScrollingFrame");
	content.BackgroundTransparency = 1;
	content.BorderSizePixel = 0;
	content.ScrollBarThickness = 4;
	content.ScrollBarImageColor3 = COLORS.neon;
	content.Size = UDim2.new(1, 0, 1, -124);
	content.Position = UDim2.new(0, 0, 0, 96);
	content.CanvasSize = UDim2.new(0, 0, 0, 0);
	content.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	content.ScrollingDirection = Enum.ScrollingDirection.Y;
	content.ClipsDescendants = false;
	content.Parent = panel;
	local cPadding = Instance.new("UIPadding");
	cPadding.PaddingLeft = UDim.new(0, 12);
	cPadding.PaddingRight = UDim.new(0, 12);
	cPadding.PaddingTop = UDim.new(0, 8);
	cPadding.PaddingBottom = UDim.new(0, 12);
	cPadding.Parent = content;
	local cLayout = Instance.new("UIListLayout");
	cLayout.Padding = UDim.new(0, 8);
	cLayout.Parent = content;
	local footer = Instance.new("Frame");
	footer.BackgroundColor3 = COLORS.panel2;
	footer.BorderSizePixel = 0;
	footer.Size = UDim2.new(1, 0, 0, 28);
	footer.Position = UDim2.new(0, 0, 1, -28);
	footer.Parent = panel;
	local vText = Instance.new("TextLabel");
	vText.BackgroundTransparency = 1;
	vText.Text = HACK_NAME .. " (c) 2026";
	vText.TextColor3 = COLORS.muted;
	vText.Font = FONT;
	vText.TextSize = 10;
	vText.Size = UDim2.new(1, -20, 1, 0);
	vText.Position = UDim2.new(0, 10, 0, 0);
	vText.TextXAlignment = Enum.TextXAlignment.Right;
	vText.Parent = footer;
	task.spawn(function()
		while screenGui.Parent do
			local FlatIdent_9147D = 0;
			while true do
				if (FlatIdent_9147D == 0) then
					if (title.Text ~= HACK_NAME) then
						title.Text = HACK_NAME;
					end
					if (lTitle.Text ~= HACK_NAME) then
						lTitle.Text = HACK_NAME;
					end
					FlatIdent_9147D = 1;
				end
				if (FlatIdent_9147D == 1) then
					if (vText.Text ~= (HACK_NAME .. " (c) 2026")) then
						vText.Text = HACK_NAME .. " (c) 2026";
					end
					task.wait(0.5);
					break;
				end
			end
		end
	end);
	local function makeDraggable(frame, dragTarget)
		local dragging, dragInput, dragStart, startPos;
		dragTarget.InputBegan:Connect(function(input)
			if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
				local FlatIdent_17196 = 0;
				while true do
					if (FlatIdent_17196 == 1) then
						startPos = frame.Position;
						input.Changed:Connect(function()
							if (input.UserInputState == Enum.UserInputState.End) then
								dragging = false;
							end
						end);
						break;
					end
					if (FlatIdent_17196 == 0) then
						dragging = true;
						dragStart = input.Position;
						FlatIdent_17196 = 1;
					end
				end
			end
		end);
		dragTarget.InputChanged:Connect(function(input)
			if ((input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch)) then
				dragInput = input;
			end
		end);
		UserInputService.InputChanged:Connect(function(input)
			if ((input == dragInput) and dragging) then
				local FlatIdent_5BA5E = 0;
				local delta;
				while true do
					if (FlatIdent_5BA5E == 0) then
						delta = input.Position - dragStart;
						frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y);
						break;
					end
				end
			end
		end);
	end
	makeDraggable(panel, header);
	local isOpen = false;
	Library.SetPanel = function(_, open)
		local FlatIdent_74348 = 0;
		while true do
			if (FlatIdent_74348 == 1) then
				if open then
					panel.Visible = true;
					local vp = workspace.CurrentCamera.ViewportSize;
					local pX = launcher.Position.X;
					local pY = launcher.Position.Y.Scale + (launcher.Size.Y.Offset / vp.Y) + 0.015;
					panel.Position = UDim2.new(pX.Scale, pX.Offset, pY, 0);
					local targetWidth = math.min(350, vp.X - 30);
					local targetHeight = math.min(480, (vp.Y - (vp.Y * pY)) - 50);
					local actualPX = (vp.X * panel.Position.X.Scale) + panel.Position.X.Offset;
					if ((actualPX - (targetWidth / 2)) < 15) then
						panel.Position = UDim2.new(0, (targetWidth / 2) + 15, pY, 0);
					elseif ((actualPX + (targetWidth / 2)) > (vp.X - 15)) then
						panel.Position = UDim2.new(0, (vp.X - (targetWidth / 2)) - 15, pY, 0);
					end
					panel.Size = UDim2.new(0, targetWidth, 0, 0);
					panel.BackgroundTransparency = 1;
					TweenService:Create(panel, TWEEN_BOUNCE, {Size=UDim2.fromOffset(targetWidth, targetHeight),BackgroundTransparency=0}):Play();
				else
					local targetWidth = panel.Size.X.Offset;
					local closeTween = TweenService:Create(panel, TWEEN_SMOOTH, {Size=UDim2.new(0, targetWidth, 0, 0),BackgroundTransparency=1});
					closeTween:Play();
					closeTween.Completed:Connect(function()
						if not isOpen then
							panel.Visible = false;
						end
					end);
				end
				break;
			end
			if (FlatIdent_74348 == 0) then
				if (isOpen == open) then
					return;
				end
				isOpen = open;
				FlatIdent_74348 = 1;
			end
		end
	end;
	launcher.MouseButton1Click:Connect(function()
		Library:SetPanel(not isOpen);
	end);
	closeBtn.MouseButton1Click:Connect(function()
		Library:SetPanel(false);
	end);
	local views, tabButtons = {}, {};
	local currentTabName = "";
	local isFirstTab = true;
	Library.CreateTab = function(self, name)
		local btn = Instance.new("TextButton");
		btn.Size = UDim2.new(0, 80, 1, 0);
		btn.BackgroundColor3 = COLORS.panel2;
		btn.BackgroundTransparency = 1;
		btn.Text = name:upper();
		btn.TextColor3 = COLORS.muted;
		btn.Font = FONT;
		btn.TextSize = 10;
		btn.AutoButtonColor = false;
		btn.Parent = tabsScroll;
		local view = Instance.new("Frame");
		view.Size = UDim2.new(1, 0, 0, 0);
		view.AutomaticSize = Enum.AutomaticSize.Y;
		view.BackgroundTransparency = 1;
		view.Visible = false;
		view.Position = UDim2.new(0, 0, 0, 0);
		view.Parent = content;
		views[name] = view;
		tabButtons[name] = btn;
		btn.MouseButton1Click:Connect(function()
			local FlatIdent_4CC24 = 0;
			local prevView;
			while true do
				if (FlatIdent_4CC24 == 1) then
					if (prevView and prevView.Visible) then
						prevView.Visible = false;
					end
					for n, b in pairs(tabButtons) do
						local FlatIdent_5B4A8 = 0;
						local isActive;
						while true do
							if (FlatIdent_5B4A8 == 1) then
								views[n].Visible = isActive;
								break;
							end
							if (FlatIdent_5B4A8 == 0) then
								isActive = n == name;
								TweenService:Create(b, TWEEN_SMOOTH, {TextColor3=((isActive and COLORS.neon) or COLORS.muted),BackgroundTransparency=((isActive and 0.9) or 1)}):Play();
								FlatIdent_5B4A8 = 1;
							end
						end
					end
					FlatIdent_4CC24 = 2;
				end
				if (FlatIdent_4CC24 == 2) then
					currentTabName = name;
					view.Position = UDim2.new(0, 0, 0, 15);
					FlatIdent_4CC24 = 3;
				end
				if (FlatIdent_4CC24 == 3) then
					view.Visible = true;
					TweenService:Create(view, TWEEN_SMOOTH, {Position=UDim2.new(0, 0, 0, 0)}):Play();
					break;
				end
				if (FlatIdent_4CC24 == 0) then
					if (currentTabName == name) then
						return;
					end
					prevView = views[currentTabName];
					FlatIdent_4CC24 = 1;
				end
			end
		end);
		if isFirstTab then
			local FlatIdent_49280 = 0;
			while true do
				if (FlatIdent_49280 == 1) then
					btn.TextColor3 = COLORS.neon;
					btn.BackgroundTransparency = 0.9;
					FlatIdent_49280 = 2;
				end
				if (FlatIdent_49280 == 2) then
					view.Visible = true;
					view.Position = UDim2.new(0, 0, 0, 0);
					break;
				end
				if (FlatIdent_49280 == 0) then
					isFirstTab = false;
					currentTabName = name;
					FlatIdent_49280 = 1;
				end
			end
		end
		return view;
	end;
	Library.CreateSection = function(self, parentTab, text)
		local FlatIdent_2388 = 0;
		local section;
		local lbl;
		while true do
			if (FlatIdent_2388 == 1) then
				section.Parent = parentTab;
				lbl = Instance.new("TextLabel");
				lbl.BackgroundTransparency = 1;
				FlatIdent_2388 = 2;
			end
			if (FlatIdent_2388 == 0) then
				section = Instance.new("Frame");
				section.Size = UDim2.new(1, 0, 0, 24);
				section.BackgroundTransparency = 1;
				FlatIdent_2388 = 1;
			end
			if (4 == FlatIdent_2388) then
				lbl.Parent = section;
				return section;
			end
			if (FlatIdent_2388 == 2) then
				lbl.Size = UDim2.new(1, 0, 1, 0);
				lbl.Text = text:upper();
				lbl.TextColor3 = COLORS.neon;
				FlatIdent_2388 = 3;
			end
			if (3 == FlatIdent_2388) then
				lbl.Font = FONT;
				lbl.TextSize = 11;
				lbl.TextXAlignment = Enum.TextXAlignment.Left;
				FlatIdent_2388 = 4;
			end
		end
	end;
	local function makeRow(parent, label, desc, h)
		local row = Instance.new("Frame");
		row.Size = UDim2.new(1, 0, 0, h or 52);
		row.BackgroundColor3 = COLORS.panel2;
		row.BorderSizePixel = 0;
		row.Parent = parent;
		corner(row, 8);
		stroke(row, COLORS.line, 1, 0);
		local lbl = Instance.new("TextLabel");
		lbl.Size = UDim2.new(1, -70, 0, 20);
		lbl.Position = UDim2.fromOffset(12, 8);
		lbl.BackgroundTransparency = 1;
		lbl.Text = label;
		lbl.TextColor3 = COLORS.text;
		lbl.Font = FONT;
		lbl.TextSize = 13;
		lbl.TextXAlignment = Enum.TextXAlignment.Left;
		lbl.Parent = row;
		if desc then
			local FlatIdent_90A41 = 0;
			local dsc;
			while true do
				if (FlatIdent_90A41 == 4) then
					dsc.TextXAlignment = Enum.TextXAlignment.Left;
					dsc.Parent = row;
					break;
				end
				if (FlatIdent_90A41 == 2) then
					dsc.Text = desc;
					dsc.TextColor3 = COLORS.muted;
					FlatIdent_90A41 = 3;
				end
				if (FlatIdent_90A41 == 3) then
					dsc.Font = FONT;
					dsc.TextSize = 10;
					FlatIdent_90A41 = 4;
				end
				if (FlatIdent_90A41 == 0) then
					dsc = Instance.new("TextLabel");
					dsc.Size = UDim2.new(1, -70, 0, 14);
					FlatIdent_90A41 = 1;
				end
				if (FlatIdent_90A41 == 1) then
					dsc.Position = UDim2.fromOffset(12, 28);
					dsc.BackgroundTransparency = 1;
					FlatIdent_90A41 = 2;
				end
			end
		end
		return row;
	end
	Library.CreateToggle = function(self, parentTab, label, desc, default, callback)
		local FlatIdent_FA88 = 0;
		local row;
		local toggle;
		local knob;
		local state;
		local update;
		while true do
			if (FlatIdent_FA88 == 0) then
				row = makeRow(parentTab, label, desc);
				toggle = Instance.new("TextButton");
				toggle.Size = UDim2.fromOffset(42, 22);
				FlatIdent_FA88 = 1;
			end
			if (FlatIdent_FA88 == 3) then
				corner(toggle, 11);
				knob = Instance.new("Frame");
				knob.Size = UDim2.fromOffset(14, 14);
				FlatIdent_FA88 = 4;
			end
			if (FlatIdent_FA88 == 7) then
				if default then
					update();
				end
				return row;
			end
			if (FlatIdent_FA88 == 1) then
				toggle.AnchorPoint = Vector2.new(1, 0.5);
				toggle.Position = UDim2.new(1, -12, 0.5, 0);
				toggle.BackgroundColor3 = COLORS.line;
				FlatIdent_FA88 = 2;
			end
			if (6 == FlatIdent_FA88) then
				update = nil;
				function update()
					TweenService:Create(toggle, TWEEN_SMOOTH, {BackgroundColor3=((state and COLORS.neon) or COLORS.line)}):Play();
					TweenService:Create(knob, TWEEN_BOUNCE, {Position=((state and UDim2.new(1, -18, 0, 4)) or UDim2.fromOffset(4, 4)),BackgroundColor3=((state and COLORS.bg) or COLORS.muted)}):Play();
					if callback then
						callback(state);
					end
				end
				toggle.MouseButton1Click:Connect(function()
					local FlatIdent_2A9F7 = 0;
					while true do
						if (FlatIdent_2A9F7 == 0) then
							state = not state;
							update();
							break;
						end
					end
				end);
				FlatIdent_FA88 = 7;
			end
			if (FlatIdent_FA88 == 4) then
				knob.Position = UDim2.fromOffset(4, 4);
				knob.BackgroundColor3 = COLORS.muted;
				knob.BorderSizePixel = 0;
				FlatIdent_FA88 = 5;
			end
			if (FlatIdent_FA88 == 2) then
				toggle.Text = "";
				toggle.AutoButtonColor = false;
				toggle.Parent = row;
				FlatIdent_FA88 = 3;
			end
			if (FlatIdent_FA88 == 5) then
				knob.Parent = toggle;
				corner(knob, 7);
				state = default or false;
				FlatIdent_FA88 = 6;
			end
		end
	end;
	Library.CreateButton = function(self, parentTab, text, callback)
		local btn = Instance.new("TextButton");
		btn.Size = UDim2.new(1, 0, 0, 36);
		btn.BackgroundColor3 = COLORS.neon;
		btn.BackgroundTransparency = 0.85;
		btn.Text = text:upper();
		btn.TextColor3 = COLORS.neon;
		btn.Font = FONT;
		btn.TextSize = 11;
		btn.AutoButtonColor = false;
		btn.Parent = parentTab;
		corner(btn, 6);
		local bStroke = stroke(btn, COLORS.neon, 1, 0.5);
		btn.MouseButton1Down:Connect(function()
			local FlatIdent_91B54 = 0;
			while true do
				if (FlatIdent_91B54 == 0) then
					TweenService:Create(btn, TWEEN_FADE, {Size=UDim2.new(0.95, 0, 0, 32),BackgroundTransparency=0.6}):Play();
					TweenService:Create(bStroke, TWEEN_FADE, {Transparency=0.1}):Play();
					break;
				end
			end
		end);
		btn.MouseButton1Up:Connect(function()
			local FlatIdent_6679B = 0;
			while true do
				if (FlatIdent_6679B == 0) then
					TweenService:Create(btn, TWEEN_FADE, {Size=UDim2.new(1, 0, 0, 36),BackgroundTransparency=0.85}):Play();
					TweenService:Create(bStroke, TWEEN_FADE, {Transparency=0.5}):Play();
					break;
				end
			end
		end);
		btn.MouseButton1Click:Connect(callback);
		return btn;
	end;
	Library.CreateSlider = function(self, parentTab, label, min, max, default, callback)
		local FlatIdent_63AE4 = 0;
		local row;
		local valLbl;
		local barBg;
		local fill;
		local slideArea;
		local dragging;
		while true do
			if (FlatIdent_63AE4 == 0) then
				row = makeRow(parentTab, label, nil, 48);
				valLbl = Instance.new("TextLabel");
				valLbl.Size = UDim2.new(0, 40, 0, 20);
				valLbl.Position = UDim2.new(1, -50, 0, 8);
				FlatIdent_63AE4 = 1;
			end
			if (FlatIdent_63AE4 == 6) then
				slideArea = Instance.new("TextButton");
				slideArea.Size = UDim2.new(1, -24, 0, 20);
				slideArea.Position = UDim2.new(0, 12, 1, -20);
				slideArea.BackgroundTransparency = 1;
				FlatIdent_63AE4 = 7;
			end
			if (FlatIdent_63AE4 == 1) then
				valLbl.BackgroundTransparency = 1;
				valLbl.Text = tostring(default);
				valLbl.TextColor3 = COLORS.neon;
				valLbl.Font = FONT;
				FlatIdent_63AE4 = 2;
			end
			if (FlatIdent_63AE4 == 5) then
				fill.BackgroundColor3 = COLORS.neon;
				fill.BorderSizePixel = 0;
				fill.Parent = barBg;
				corner(fill, 2);
				FlatIdent_63AE4 = 6;
			end
			if (FlatIdent_63AE4 == 4) then
				barBg.Parent = row;
				corner(barBg, 2);
				fill = Instance.new("Frame");
				fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0);
				FlatIdent_63AE4 = 5;
			end
			if (FlatIdent_63AE4 == 3) then
				barBg.Size = UDim2.new(1, -24, 0, 4);
				barBg.Position = UDim2.new(0, 12, 1, -12);
				barBg.BackgroundColor3 = COLORS.line;
				barBg.BorderSizePixel = 0;
				FlatIdent_63AE4 = 4;
			end
			if (FlatIdent_63AE4 == 2) then
				valLbl.TextSize = 12;
				valLbl.TextXAlignment = Enum.TextXAlignment.Right;
				valLbl.Parent = row;
				barBg = Instance.new("Frame");
				FlatIdent_63AE4 = 3;
			end
			if (8 == FlatIdent_63AE4) then
				slideArea.InputEnded:Connect(function(input)
					if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
						dragging = false;
					end
				end);
				slideArea.InputChanged:Connect(function(input)
					if (dragging and ((input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch))) then
						local FlatIdent_8638E = 0;
						local percent;
						local value;
						while true do
							if (FlatIdent_8638E == 1) then
								fill.Size = UDim2.new(percent, 0, 1, 0);
								valLbl.Text = tostring(value);
								FlatIdent_8638E = 2;
							end
							if (FlatIdent_8638E == 0) then
								percent = math.clamp((input.Position.X - slideArea.AbsolutePosition.X) / slideArea.AbsoluteSize.X, 0, 1);
								value = math.floor(min + ((max - min) * percent) + 0.5);
								FlatIdent_8638E = 1;
							end
							if (FlatIdent_8638E == 2) then
								if callback then
									callback(value);
								end
								break;
							end
						end
					end
				end);
				return row;
			end
			if (FlatIdent_63AE4 == 7) then
				slideArea.Text = "";
				slideArea.Parent = row;
				dragging = false;
				slideArea.InputBegan:Connect(function(input)
					if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
						dragging = true;
					end
				end);
				FlatIdent_63AE4 = 8;
			end
		end
	end;
	Library.CreateTextBox = function(self, parentTab, label, default, callback)
		local FlatIdent_94AF7 = 0;
		local row;
		local box;
		while true do
			if (FlatIdent_94AF7 == 3) then
				corner(box, 4);
				stroke(box, COLORS.line, 1, 0);
				box.FocusLost:Connect(function()
					if callback then
						callback(box.Text);
					end
				end);
				return row;
			end
			if (FlatIdent_94AF7 == 2) then
				box.Font = FONT;
				box.TextSize = 11;
				box.ClearTextOnFocus = false;
				box.Parent = row;
				FlatIdent_94AF7 = 3;
			end
			if (FlatIdent_94AF7 == 0) then
				row = makeRow(parentTab, label, nil, 52);
				box = Instance.new("TextBox");
				box.Size = UDim2.new(1, -24, 0, 24);
				box.Position = UDim2.new(0, 12, 1, -32);
				FlatIdent_94AF7 = 1;
			end
			if (1 == FlatIdent_94AF7) then
				box.BackgroundColor3 = COLORS.panel;
				box.TextColor3 = COLORS.text;
				box.PlaceholderText = "Nhập...";
				box.Text = default or "";
				FlatIdent_94AF7 = 2;
			end
		end
	end;
	Library.CreateDropdown = function(self, parentTab, label, list, callback)
		local FlatIdent_D14D = 0;
		local row;
		local btn;
		local isDropped;
		local dropFrame;
		local dropLayout;
		while true do
			if (FlatIdent_D14D == 1) then
				btn.AnchorPoint = Vector2.new(0, 0.5);
				btn.BackgroundColor3 = COLORS.panel;
				btn.Text = "Chọn...";
				btn.TextColor3 = COLORS.neon;
				FlatIdent_D14D = 2;
			end
			if (FlatIdent_D14D == 4) then
				dropFrame.Position = UDim2.new(1, -112, 1, 4);
				dropFrame.BackgroundColor3 = COLORS.panel2;
				dropFrame.Visible = false;
				dropFrame.ZIndex = 10;
				FlatIdent_D14D = 5;
			end
			if (FlatIdent_D14D == 6) then
				dropLayout.Parent = dropFrame;
				for i, v in ipairs(list) do
					local FlatIdent_527C6 = 0;
					local opt;
					while true do
						if (FlatIdent_527C6 == 3) then
							opt.TextSize = 11;
							opt.ZIndex = 11;
							FlatIdent_527C6 = 4;
						end
						if (FlatIdent_527C6 == 2) then
							opt.TextColor3 = COLORS.text;
							opt.Font = FONT;
							FlatIdent_527C6 = 3;
						end
						if (1 == FlatIdent_527C6) then
							opt.BackgroundTransparency = 1;
							opt.Text = tostring(v);
							FlatIdent_527C6 = 2;
						end
						if (FlatIdent_527C6 == 0) then
							opt = Instance.new("TextButton");
							opt.Size = UDim2.new(1, 0, 0, 24);
							FlatIdent_527C6 = 1;
						end
						if (FlatIdent_527C6 == 4) then
							opt.Parent = dropFrame;
							opt.MouseButton1Click:Connect(function()
								local FlatIdent_1512 = 0;
								while true do
									if (FlatIdent_1512 == 1) then
										dropFrame.Size = UDim2.new(0, 100, 0, 0);
										if callback then
											callback(v);
										end
										break;
									end
									if (0 == FlatIdent_1512) then
										btn.Text = tostring(v);
										dropFrame.Visible = false;
										FlatIdent_1512 = 1;
									end
								end
							end);
							break;
						end
					end
				end
				btn.MouseButton1Click:Connect(function()
					local FlatIdent_1DFAF = 0;
					while true do
						if (FlatIdent_1DFAF == 0) then
							isDropped = not isDropped;
							if isDropped then
								dropFrame.Visible = true;
								dropFrame.Size = UDim2.new(0, 100, 0, #list * 24);
							else
								local FlatIdent_699E4 = 0;
								while true do
									if (FlatIdent_699E4 == 0) then
										dropFrame.Visible = false;
										dropFrame.Size = UDim2.new(0, 100, 0, 0);
										break;
									end
								end
							end
							break;
						end
					end
				end);
				return row;
			end
			if (FlatIdent_D14D == 3) then
				stroke(btn, COLORS.neon, 1, 0.5);
				isDropped = false;
				dropFrame = Instance.new("Frame");
				dropFrame.Size = UDim2.new(0, 100, 0, 0);
				FlatIdent_D14D = 4;
			end
			if (0 == FlatIdent_D14D) then
				row = makeRow(parentTab, label, nil, 52);
				btn = Instance.new("TextButton");
				btn.Size = UDim2.new(0, 100, 0, 24);
				btn.Position = UDim2.new(1, -112, 0.5, 0);
				FlatIdent_D14D = 1;
			end
			if (FlatIdent_D14D == 5) then
				dropFrame.Parent = row;
				corner(dropFrame, 4);
				stroke(dropFrame, COLORS.line, 1, 0);
				dropLayout = Instance.new("UIListLayout");
				FlatIdent_D14D = 6;
			end
			if (2 == FlatIdent_D14D) then
				btn.Font = FONT;
				btn.TextSize = 11;
				btn.Parent = row;
				corner(btn, 4);
				FlatIdent_D14D = 3;
			end
		end
	end;
	return Library;
end;
return Library;
			if (0 == FlatIdent_D14D) then
				row = makeRow(parentTab, label, nil, 52);
				btn = Instance.new("TextButton");
				btn.Size = UDim2.new(0, 100, 0, 24);
				btn.Position = UDim2.new(1, -112, 0.5, 0);
				FlatIdent_D14D = 1;
			end
			if (FlatIdent_D14D == 5) then
				dropFrame.Parent = row;
				corner(dropFrame, 4);
				stroke(dropFrame, COLORS.line, 1, 0);
				dropLayout = Instance.new("UIListLayout");
				FlatIdent_D14D = 6;
			end
			if (2 == FlatIdent_D14D) then
				btn.Font = FONT;
				btn.TextSize = 11;
				btn.Parent = row;
				corner(btn, 4);
				FlatIdent_D14D = 3;
			end
		end
	end;
	return Library;
end;
return Library;
