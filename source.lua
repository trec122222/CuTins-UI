local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local UserInputService = game:GetService("UserInputService");
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local Library = {};
local COLORS = {bg=Color3.fromRGB(8, 14, 15),panel=Color3.fromRGB(12, 22, 24),panel2=Color3.fromRGB(18, 32, 35),line=Color3.fromRGB(30, 52, 56),neon=Color3.fromRGB(0, 255, 198),danger=Color3.fromRGB(255, 59, 92),text=Color3.fromRGB(200, 247, 239),muted=Color3.fromRGB(95, 139, 134)};
local FONT = Enum.Font.Code;
local TWEEN_SMOOTH = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local TWEEN_BOUNCE = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
local TWEEN_FADE = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local function corner(parent, r)
	local FlatIdent_7126A = 0;
	local FlatIdent_95CAC;
	local c;
	while true do
		if (FlatIdent_7126A == 1) then
			while true do
				local FlatIdent_2661B = 0;
				while true do
					if (FlatIdent_2661B == 0) then
						if (FlatIdent_95CAC == 1) then
							local FlatIdent_475BC = 0;
							while true do
								if (FlatIdent_475BC == 0) then
									c.Parent = parent;
									return c;
								end
							end
						end
						if (FlatIdent_95CAC == 0) then
							local FlatIdent_60EA1 = 0;
							while true do
								if (FlatIdent_60EA1 == 1) then
									FlatIdent_95CAC = 1;
									break;
								end
								if (FlatIdent_60EA1 == 0) then
									c = Instance.new("UICorner");
									c.CornerRadius = UDim.new(0, r);
									FlatIdent_60EA1 = 1;
								end
							end
						end
						break;
					end
				end
			end
			break;
		end
		if (FlatIdent_7126A == 0) then
			FlatIdent_95CAC = 0;
			c = nil;
			FlatIdent_7126A = 1;
		end
	end
end
local function stroke(parent, color, thickness, transparency)
	local FlatIdent_8D327 = 0;
	local s;
	while true do
		local FlatIdent_8F047 = 0;
		while true do
			if (FlatIdent_8F047 == 0) then
				if (FlatIdent_8D327 == 2) then
					s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					s.Parent = parent;
					FlatIdent_8D327 = 3;
				end
				if (FlatIdent_8D327 == 1) then
					local FlatIdent_6FA1 = 0;
					while true do
						if (FlatIdent_6FA1 == 1) then
							FlatIdent_8D327 = 2;
							break;
						end
						if (0 == FlatIdent_6FA1) then
							s.Thickness = thickness or 1;
							s.Transparency = transparency or 0;
							FlatIdent_6FA1 = 1;
						end
					end
				end
				FlatIdent_8F047 = 1;
			end
			if (FlatIdent_8F047 == 1) then
				if (FlatIdent_8D327 == 3) then
					return s;
				end
				if (FlatIdent_8D327 == 0) then
					s = Instance.new("UIStroke");
					s.Color = color;
					FlatIdent_8D327 = 1;
				end
				break;
			end
		end
	end
end
local notifGui = Instance.new("ScreenGui");
notifGui.Name = "CuTinNotifs";
notifGui.ResetOnSpawn = false;
notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
notifGui.Parent = playerGui;
Library.Notify = function(self, title, text)
	local FlatIdent_940A0 = 0;
	local notif;
	local t1;
	local t2;
	while true do
		if (FlatIdent_940A0 == 4) then
			t1.TextColor3 = COLORS.neon;
			t1.Font = FONT;
			t1.TextSize = 14;
			FlatIdent_940A0 = 5;
		end
		if (FlatIdent_940A0 == 6) then
			t2.BackgroundTransparency = 1;
			t2.Size = UDim2.new(1, -20, 0, 20);
			t2.Position = UDim2.fromOffset(10, 30);
			FlatIdent_940A0 = 7;
		end
		if (FlatIdent_940A0 == 8) then
			t2.TextSize = 11;
			t2.TextXAlignment = Enum.TextXAlignment.Left;
			t2.Parent = notif;
			FlatIdent_940A0 = 9;
		end
		if (0 == FlatIdent_940A0) then
			notif = Instance.new("Frame");
			notif.Size = UDim2.fromOffset(250, 60);
			notif.Position = UDim2.new(1, 350, 0.8, 0);
			FlatIdent_940A0 = 1;
		end
		if (FlatIdent_940A0 == 5) then
			t1.TextXAlignment = Enum.TextXAlignment.Left;
			t1.Parent = notif;
			t2 = Instance.new("TextLabel");
			FlatIdent_940A0 = 6;
		end
		if (FlatIdent_940A0 == 9) then
			TweenService:Create(notif, TWEEN_SMOOTH, {Position=UDim2.new(1, -260, 0.8, 0)}):Play();
			task.delay(3, function()
				local FlatIdent_29B3D = 0;
				local FlatIdent_47A9C;
				local tween;
				while true do
					if (FlatIdent_29B3D == 1) then
						while true do
							if (FlatIdent_47A9C == 1) then
								tween.Completed:Connect(function()
									notif:Destroy();
								end);
								break;
							end
							if (FlatIdent_47A9C == 0) then
								local FlatIdent_39764 = 0;
								while true do
									if (FlatIdent_39764 == 0) then
										tween = TweenService:Create(notif, TWEEN_SMOOTH, {Position=UDim2.new(1, 350, 0.8, 0)});
										tween:Play();
										FlatIdent_39764 = 1;
									end
									if (FlatIdent_39764 == 1) then
										FlatIdent_47A9C = 1;
										break;
									end
								end
							end
						end
						break;
					end
					if (FlatIdent_29B3D == 0) then
						FlatIdent_47A9C = 0;
						tween = nil;
						FlatIdent_29B3D = 1;
					end
				end
			end);
			break;
		end
		if (2 == FlatIdent_940A0) then
			stroke(notif, COLORS.neon, 1, 0.5);
			t1 = Instance.new("TextLabel");
			t1.BackgroundTransparency = 1;
			FlatIdent_940A0 = 3;
		end
		if (FlatIdent_940A0 == 1) then
			notif.BackgroundColor3 = COLORS.panel;
			notif.Parent = notifGui;
			corner(notif, 8);
			FlatIdent_940A0 = 2;
		end
		if (FlatIdent_940A0 == 3) then
			t1.Size = UDim2.new(1, -20, 0, 20);
			t1.Position = UDim2.fromOffset(10, 8);
			t1.Text = title;
			FlatIdent_940A0 = 4;
		end
		if (FlatIdent_940A0 == 7) then
			t2.Text = text;
			t2.TextColor3 = COLORS.text;
			t2.Font = FONT;
			FlatIdent_940A0 = 8;
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
	closeBtn.Size = UDim2.fromOffset(30, 30);
	closeBtn.Position = UDim2.new(1, -40, 0, 15);
	closeBtn.BackgroundColor3 = COLORS.danger;
	closeBtn.BackgroundTransparency = 0.85;
	closeBtn.Text = "X";
	closeBtn.TextColor3 = COLORS.danger;
	closeBtn.Font = FONT;
	closeBtn.TextSize = 14;
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
	content.ScrollBarThickness = 3;
	content.ScrollBarImageColor3 = COLORS.neon;
	content.Size = UDim2.new(1, 0, 1, -124);
	content.Position = UDim2.new(0, 0, 0, 96);
	content.CanvasSize = UDim2.new(0, 0, 0, 0);
	content.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	content.ScrollingDirection = Enum.ScrollingDirection.Y;
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
			local FlatIdent_2E9CB = 0;
			while true do
				if (FlatIdent_2E9CB == 1) then
					if (vText.Text ~= (HACK_NAME .. " (c) 2026")) then
						vText.Text = HACK_NAME .. " (c) 2026";
					end
					task.wait(0.5);
					break;
				end
				if (FlatIdent_2E9CB == 0) then
					if (title.Text ~= HACK_NAME) then
						title.Text = HACK_NAME;
					end
					if (lTitle.Text ~= HACK_NAME) then
						lTitle.Text = HACK_NAME;
					end
					FlatIdent_2E9CB = 1;
				end
			end
		end
	end);
	local function makeDraggable(frame, dragTarget)
		local FlatIdent_77C29 = 0;
		local dragging;
		local dragInput;
		local dragStart;
		local startPos;
		while true do
			if (FlatIdent_77C29 == 0) then
				local FlatIdent_8BC55 = 0;
				while true do
					if (FlatIdent_8BC55 == 1) then
						FlatIdent_77C29 = 1;
						break;
					end
					if (FlatIdent_8BC55 == 0) then
						dragging, dragInput, dragStart, startPos = nil;
						dragTarget.InputBegan:Connect(function(input)
							if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
								local FlatIdent_8B336 = 0;
								local FlatIdent_2AC68;
								while true do
									if (FlatIdent_8B336 == 0) then
										FlatIdent_2AC68 = 0;
										while true do
											if (FlatIdent_2AC68 == 0) then
												local FlatIdent_2BE02 = 0;
												while true do
													if (FlatIdent_2BE02 == 1) then
														FlatIdent_2AC68 = 1;
														break;
													end
													if (FlatIdent_2BE02 == 0) then
														dragging = true;
														dragStart = input.Position;
														FlatIdent_2BE02 = 1;
													end
												end
											end
											if (FlatIdent_2AC68 == 1) then
												startPos = frame.Position;
												input.Changed:Connect(function()
													if (input.UserInputState == Enum.UserInputState.End) then
														dragging = false;
													end
												end);
												break;
											end
										end
										break;
									end
								end
							end
						end);
						FlatIdent_8BC55 = 1;
					end
				end
			end
			if (FlatIdent_77C29 == 1) then
				dragTarget.InputChanged:Connect(function(input)
					if ((input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch)) then
						dragInput = input;
					end
				end);
				UserInputService.InputChanged:Connect(function(input)
					if ((input == dragInput) and dragging) then
						local FlatIdent_7DFA5 = 0;
						local FlatIdent_33EA4;
						local delta;
						while true do
							if (FlatIdent_7DFA5 == 1) then
								while true do
									if (FlatIdent_33EA4 == 0) then
										delta = input.Position - dragStart;
										frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y);
										break;
									end
								end
								break;
							end
							if (FlatIdent_7DFA5 == 0) then
								FlatIdent_33EA4 = 0;
								delta = nil;
								FlatIdent_7DFA5 = 1;
							end
						end
					end
				end);
				break;
			end
		end
	end
	makeDraggable(panel, header);
	local isOpen = false;
	Library.SetPanel = function(_, open)
		local FlatIdent_25DF3 = 0;
		while true do
			if (FlatIdent_25DF3 == 1) then
				if open then
					local FlatIdent_66799 = 0;
					local vp;
					local pX;
					local pY;
					local targetWidth;
					local targetHeight;
					local actualPX;
					while true do
						if (FlatIdent_66799 == 1) then
							local FlatIdent_3B7E2 = 0;
							while true do
								if (FlatIdent_3B7E2 == 0) then
									panel.Position = UDim2.new(pX.Scale, pX.Offset, pY, 0);
									targetWidth = math.min(350, vp.X - 30);
									FlatIdent_3B7E2 = 1;
								end
								if (2 == FlatIdent_3B7E2) then
									FlatIdent_66799 = 2;
									break;
								end
								if (FlatIdent_3B7E2 == 1) then
									targetHeight = math.min(480, (vp.Y - (vp.Y * pY)) - 50);
									actualPX = (vp.X * panel.Position.X.Scale) + panel.Position.X.Offset;
									FlatIdent_3B7E2 = 2;
								end
							end
						end
						if (FlatIdent_66799 == 0) then
							local FlatIdent_40070 = 0;
							while true do
								if (FlatIdent_40070 == 2) then
									FlatIdent_66799 = 1;
									break;
								end
								if (1 == FlatIdent_40070) then
									pX = launcher.Position.X;
									pY = launcher.Position.Y.Scale + (launcher.Size.Y.Offset / vp.Y) + 0.015;
									FlatIdent_40070 = 2;
								end
								if (FlatIdent_40070 == 0) then
									panel.Visible = true;
									vp = workspace.CurrentCamera.ViewportSize;
									FlatIdent_40070 = 1;
								end
							end
						end
						if (2 == FlatIdent_66799) then
							if ((actualPX - (targetWidth / 2)) < 15) then
								panel.Position = UDim2.new(0, (targetWidth / 2) + 15, pY, 0);
							elseif ((actualPX + (targetWidth / 2)) > (vp.X - 15)) then
								panel.Position = UDim2.new(0, (vp.X - (targetWidth / 2)) - 15, pY, 0);
							end
							panel.Size = UDim2.new(0, targetWidth, 0, 0);
							panel.BackgroundTransparency = 1;
							TweenService:Create(panel, TWEEN_BOUNCE, {Size=UDim2.fromOffset(targetWidth, targetHeight),BackgroundTransparency=0}):Play();
							break;
						end
					end
				else
					local FlatIdent_4223E = 0;
					local FlatIdent_817B0;
					local targetWidth;
					local closeTween;
					while true do
						if (FlatIdent_4223E == 0) then
							FlatIdent_817B0 = 0;
							targetWidth = nil;
							FlatIdent_4223E = 1;
						end
						if (FlatIdent_4223E == 1) then
							closeTween = nil;
							while true do
								if (FlatIdent_817B0 == 0) then
									local FlatIdent_5E109 = 0;
									while true do
										if (FlatIdent_5E109 == 0) then
											targetWidth = panel.Size.X.Offset;
											closeTween = TweenService:Create(panel, TWEEN_SMOOTH, {Size=UDim2.new(0, targetWidth, 0, 0),BackgroundTransparency=1});
											FlatIdent_5E109 = 1;
										end
										if (FlatIdent_5E109 == 1) then
											FlatIdent_817B0 = 1;
											break;
										end
									end
								end
								if (FlatIdent_817B0 == 1) then
									closeTween:Play();
									closeTween.Completed:Connect(function()
										if not isOpen then
											panel.Visible = false;
										end
									end);
									break;
								end
							end
							break;
						end
					end
				end
				break;
			end
			if (FlatIdent_25DF3 == 0) then
				local FlatIdent_15A17 = 0;
				while true do
					if (FlatIdent_15A17 == 1) then
						FlatIdent_25DF3 = 1;
						break;
					end
					if (FlatIdent_15A17 == 0) then
						if (isOpen == open) then
							return;
						end
						isOpen = open;
						FlatIdent_15A17 = 1;
					end
				end
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
			local FlatIdent_83844 = 0;
			local FlatIdent_9622C;
			local prevView;
			while true do
				if (FlatIdent_83844 == 0) then
					FlatIdent_9622C = 0;
					prevView = nil;
					FlatIdent_83844 = 1;
				end
				if (1 == FlatIdent_83844) then
					while true do
						if (3 == FlatIdent_9622C) then
							view.Visible = true;
							TweenService:Create(view, TWEEN_SMOOTH, {Position=UDim2.new(0, 0, 0, 0)}):Play();
							break;
						end
						if (FlatIdent_9622C == 1) then
							local FlatIdent_92F66 = 0;
							while true do
								if (FlatIdent_92F66 == 1) then
									FlatIdent_9622C = 2;
									break;
								end
								if (FlatIdent_92F66 == 0) then
									if (prevView and prevView.Visible) then
										prevView.Visible = false;
									end
									for n, b in pairs(tabButtons) do
										local FlatIdent_94AF7 = 0;
										local FlatIdent_6DC53;
										local isActive;
										while true do
											if (FlatIdent_94AF7 == 0) then
												FlatIdent_6DC53 = 0;
												isActive = nil;
												FlatIdent_94AF7 = 1;
											end
											if (FlatIdent_94AF7 == 1) then
												while true do
													if (0 == FlatIdent_6DC53) then
														local FlatIdent_4E551 = 0;
														while true do
															if (FlatIdent_4E551 == 0) then
																isActive = n == name;
																TweenService:Create(b, TWEEN_SMOOTH, {TextColor3=((isActive and COLORS.neon) or COLORS.muted),BackgroundTransparency=((isActive and 0.9) or 1)}):Play();
																FlatIdent_4E551 = 1;
															end
															if (FlatIdent_4E551 == 1) then
																FlatIdent_6DC53 = 1;
																break;
															end
														end
													end
													if (1 == FlatIdent_6DC53) then
														views[n].Visible = isActive;
														break;
													end
												end
												break;
											end
										end
									end
									FlatIdent_92F66 = 1;
								end
							end
						end
						if (FlatIdent_9622C == 2) then
							currentTabName = name;
							view.Position = UDim2.new(0, 0, 0, 15);
							FlatIdent_9622C = 3;
						end
						if (FlatIdent_9622C == 0) then
							local FlatIdent_6EEC8 = 0;
							while true do
								if (0 == FlatIdent_6EEC8) then
									if (currentTabName == name) then
										return;
									end
									prevView = views[currentTabName];
									FlatIdent_6EEC8 = 1;
								end
								if (FlatIdent_6EEC8 == 1) then
									FlatIdent_9622C = 1;
									break;
								end
							end
						end
					end
					break;
				end
			end
		end);
		if (currentTabName == "") then
			local FlatIdent_2BE68 = 0;
			while true do
				if (FlatIdent_2BE68 == 2) then
					view.Position = UDim2.new(0, 0, 0, 0);
					break;
				end
				if (FlatIdent_2BE68 == 1) then
					btn.BackgroundTransparency = 0.9;
					view.Visible = true;
					FlatIdent_2BE68 = 2;
				end
				if (FlatIdent_2BE68 == 0) then
					currentTabName = name;
					btn.TextColor3 = COLORS.neon;
					FlatIdent_2BE68 = 1;
				end
			end
		end
		return view;
	end;
	local function makeRow(parent, label, desc, h)
		local FlatIdent_68E92 = 0;
		local row;
		local lbl;
		while true do
			if (FlatIdent_68E92 == 2) then
				local FlatIdent_527C6 = 0;
				while true do
					if (FlatIdent_527C6 == 0) then
						lbl.Size = UDim2.new(1, -70, 0, 20);
						lbl.Position = UDim2.fromOffset(12, 8);
						FlatIdent_527C6 = 1;
					end
					if (FlatIdent_527C6 == 2) then
						FlatIdent_68E92 = 3;
						break;
					end
					if (1 == FlatIdent_527C6) then
						lbl.BackgroundTransparency = 1;
						lbl.Text = label;
						FlatIdent_527C6 = 2;
					end
				end
			end
			if (FlatIdent_68E92 == 3) then
				local FlatIdent_6DFD9 = 0;
				while true do
					if (2 == FlatIdent_6DFD9) then
						FlatIdent_68E92 = 4;
						break;
					end
					if (FlatIdent_6DFD9 == 0) then
						lbl.TextColor3 = COLORS.text;
						lbl.Font = FONT;
						FlatIdent_6DFD9 = 1;
					end
					if (FlatIdent_6DFD9 == 1) then
						lbl.TextSize = 13;
						lbl.TextXAlignment = Enum.TextXAlignment.Left;
						FlatIdent_6DFD9 = 2;
					end
				end
			end
			if (FlatIdent_68E92 == 4) then
				lbl.Parent = row;
				if desc then
					local FlatIdent_229D1 = 0;
					local FlatIdent_3CF36;
					local dsc;
					while true do
						if (FlatIdent_229D1 == 0) then
							FlatIdent_3CF36 = 0;
							dsc = nil;
							FlatIdent_229D1 = 1;
						end
						if (FlatIdent_229D1 == 1) then
							while true do
								if (FlatIdent_3CF36 == 1) then
									local FlatIdent_699E4 = 0;
									while true do
										if (FlatIdent_699E4 == 0) then
											dsc.Position = UDim2.fromOffset(12, 28);
											dsc.BackgroundTransparency = 1;
											FlatIdent_699E4 = 1;
										end
										if (FlatIdent_699E4 == 1) then
											FlatIdent_3CF36 = 2;
											break;
										end
									end
								end
								if (FlatIdent_3CF36 == 4) then
									dsc.TextXAlignment = Enum.TextXAlignment.Left;
									dsc.Parent = row;
									break;
								end
								if (0 == FlatIdent_3CF36) then
									dsc = Instance.new("TextLabel");
									dsc.Size = UDim2.new(1, -70, 0, 14);
									FlatIdent_3CF36 = 1;
								end
								if (FlatIdent_3CF36 == 2) then
									local FlatIdent_1BAD7 = 0;
									while true do
										if (FlatIdent_1BAD7 == 0) then
											dsc.Text = desc;
											dsc.TextColor3 = COLORS.muted;
											FlatIdent_1BAD7 = 1;
										end
										if (FlatIdent_1BAD7 == 1) then
											FlatIdent_3CF36 = 3;
											break;
										end
									end
								end
								if (FlatIdent_3CF36 == 3) then
									local FlatIdent_6EF7B = 0;
									while true do
										if (FlatIdent_6EF7B == 0) then
											dsc.Font = FONT;
											dsc.TextSize = 10;
											FlatIdent_6EF7B = 1;
										end
										if (FlatIdent_6EF7B == 1) then
											FlatIdent_3CF36 = 4;
											break;
										end
									end
								end
							end
							break;
						end
					end
				end
				return row;
			end
			if (FlatIdent_68E92 == 0) then
				local FlatIdent_6E214 = 0;
				while true do
					if (FlatIdent_6E214 == 2) then
						FlatIdent_68E92 = 1;
						break;
					end
					if (FlatIdent_6E214 == 1) then
						row.BackgroundColor3 = COLORS.panel2;
						row.BorderSizePixel = 0;
						FlatIdent_6E214 = 2;
					end
					if (FlatIdent_6E214 == 0) then
						row = Instance.new("Frame");
						row.Size = UDim2.new(1, 0, 0, h or 52);
						FlatIdent_6E214 = 1;
					end
				end
			end
			if (FlatIdent_68E92 == 1) then
				local FlatIdent_14124 = 0;
				while true do
					if (0 == FlatIdent_14124) then
						row.Parent = parent;
						corner(row, 8);
						FlatIdent_14124 = 1;
					end
					if (FlatIdent_14124 == 1) then
						stroke(row, COLORS.line, 1, 0);
						lbl = Instance.new("TextLabel");
						FlatIdent_14124 = 2;
					end
					if (FlatIdent_14124 == 2) then
						FlatIdent_68E92 = 2;
						break;
					end
				end
			end
		end
	end
	Library.CreateToggle = function(self, parentTab, label, desc, default, callback)
		local FlatIdent_882F4 = 0;
		local row;
		local toggle;
		local knob;
		local state;
		local update;
		while true do
			if (FlatIdent_882F4 == 1) then
				local FlatIdent_37555 = 0;
				while true do
					if (FlatIdent_37555 == 1) then
						toggle.BackgroundColor3 = COLORS.line;
						FlatIdent_882F4 = 2;
						break;
					end
					if (FlatIdent_37555 == 0) then
						toggle.AnchorPoint = Vector2.new(1, 0.5);
						toggle.Position = UDim2.new(1, -12, 0.5, 0);
						FlatIdent_37555 = 1;
					end
				end
			end
			if (FlatIdent_882F4 == 7) then
				if default then
					update();
				end
				return row;
			end
			if (FlatIdent_882F4 == 6) then
				local FlatIdent_2DB3E = 0;
				while true do
					if (FlatIdent_2DB3E == 1) then
						toggle.MouseButton1Click:Connect(function()
							local FlatIdent_628E3 = 0;
							while true do
								if (FlatIdent_628E3 == 0) then
									state = not state;
									update();
									break;
								end
							end
						end);
						FlatIdent_882F4 = 7;
						break;
					end
					if (FlatIdent_2DB3E == 0) then
						update = nil;
						function update()
							local FlatIdent_7D3C9 = 0;
							local FlatIdent_272FB;
							while true do
								if (0 == FlatIdent_7D3C9) then
									FlatIdent_272FB = 0;
									while true do
										if (FlatIdent_272FB == 0) then
											TweenService:Create(toggle, TWEEN_SMOOTH, {BackgroundColor3=((state and COLORS.neon) or COLORS.line)}):Play();
											TweenService:Create(knob, TWEEN_BOUNCE, {Position=((state and UDim2.new(1, -18, 0, 4)) or UDim2.fromOffset(4, 4)),BackgroundColor3=((state and COLORS.bg) or COLORS.muted)}):Play();
											FlatIdent_272FB = 1;
										end
										if (1 == FlatIdent_272FB) then
											if callback then
												callback(state);
											end
											break;
										end
									end
									break;
								end
							end
						end
						FlatIdent_2DB3E = 1;
					end
				end
			end
			if (FlatIdent_882F4 == 0) then
				row = makeRow(parentTab, label, desc);
				toggle = Instance.new("TextButton");
				toggle.Size = UDim2.fromOffset(42, 22);
				FlatIdent_882F4 = 1;
			end
			if (FlatIdent_882F4 == 2) then
				local FlatIdent_15034 = 0;
				while true do
					if (FlatIdent_15034 == 1) then
						toggle.Parent = row;
						FlatIdent_882F4 = 3;
						break;
					end
					if (FlatIdent_15034 == 0) then
						toggle.Text = "";
						toggle.AutoButtonColor = false;
						FlatIdent_15034 = 1;
					end
				end
			end
			if (FlatIdent_882F4 == 4) then
				local FlatIdent_253F0 = 0;
				while true do
					if (0 == FlatIdent_253F0) then
						knob.Position = UDim2.fromOffset(4, 4);
						knob.BackgroundColor3 = COLORS.muted;
						FlatIdent_253F0 = 1;
					end
					if (1 == FlatIdent_253F0) then
						knob.BorderSizePixel = 0;
						FlatIdent_882F4 = 5;
						break;
					end
				end
			end
			if (FlatIdent_882F4 == 3) then
				local FlatIdent_6B9E2 = 0;
				while true do
					if (FlatIdent_6B9E2 == 0) then
						corner(toggle, 11);
						knob = Instance.new("Frame");
						FlatIdent_6B9E2 = 1;
					end
					if (FlatIdent_6B9E2 == 1) then
						knob.Size = UDim2.fromOffset(14, 14);
						FlatIdent_882F4 = 4;
						break;
					end
				end
			end
			if (FlatIdent_882F4 == 5) then
				local FlatIdent_1CFC3 = 0;
				while true do
					if (FlatIdent_1CFC3 == 0) then
						knob.Parent = toggle;
						corner(knob, 7);
						FlatIdent_1CFC3 = 1;
					end
					if (FlatIdent_1CFC3 == 1) then
						state = default or false;
						FlatIdent_882F4 = 6;
						break;
					end
				end
			end
		end
	end;
	Library.CreateButton = function(self, parentTab, text, callback)
		local FlatIdent_35C62 = 0;
		local btn;
		local bStroke;
		while true do
			if (0 == FlatIdent_35C62) then
				btn = Instance.new("TextButton");
				btn.Size = UDim2.new(1, 0, 0, 36);
				btn.BackgroundColor3 = COLORS.neon;
				FlatIdent_35C62 = 1;
			end
			if (FlatIdent_35C62 == 2) then
				btn.Font = FONT;
				btn.TextSize = 11;
				btn.AutoButtonColor = false;
				FlatIdent_35C62 = 3;
			end
			if (FlatIdent_35C62 == 4) then
				btn.MouseButton1Down:Connect(function()
					local FlatIdent_2E34E = 0;
					while true do
						if (FlatIdent_2E34E == 0) then
							TweenService:Create(btn, TWEEN_FADE, {Size=UDim2.new(0.95, 0, 0, 32),BackgroundTransparency=0.6}):Play();
							TweenService:Create(bStroke, TWEEN_FADE, {Transparency=0.1}):Play();
							break;
						end
					end
				end);
				btn.MouseButton1Up:Connect(function()
					local FlatIdent_47EEF = 0;
					local FlatIdent_2A9F7;
					while true do
						if (FlatIdent_47EEF == 0) then
							FlatIdent_2A9F7 = 0;
							while true do
								if (FlatIdent_2A9F7 == 0) then
									TweenService:Create(btn, TWEEN_FADE, {Size=UDim2.new(1, 0, 0, 36),BackgroundTransparency=0.85}):Play();
									TweenService:Create(bStroke, TWEEN_FADE, {Transparency=0.5}):Play();
									break;
								end
							end
							break;
						end
					end
				end);
				btn.MouseButton1Click:Connect(callback);
				FlatIdent_35C62 = 5;
			end
			if (FlatIdent_35C62 == 3) then
				btn.Parent = parentTab;
				corner(btn, 6);
				bStroke = stroke(btn, COLORS.neon, 1, 0.5);
				FlatIdent_35C62 = 4;
			end
			if (5 == FlatIdent_35C62) then
				return btn;
			end
			if (FlatIdent_35C62 == 1) then
				btn.BackgroundTransparency = 0.85;
				btn.Text = text:upper();
				btn.TextColor3 = COLORS.neon;
				FlatIdent_35C62 = 2;
			end
		end
	end;
	Library.CreateSlider = function(self, parentTab, label, min, max, default, callback)
		local FlatIdent_91B54 = 0;
		local row;
		local valLbl;
		local barBg;
		local fill;
		local slideArea;
		local dragging;
		while true do
			if (FlatIdent_91B54 == 5) then
				local FlatIdent_47A85 = 0;
				while true do
					if (2 == FlatIdent_47A85) then
						return row;
					end
					if (FlatIdent_47A85 == 1) then
						UserInputService.InputEnded:Connect(function(input)
							if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
								dragging = false;
							end
						end);
						UserInputService.InputChanged:Connect(function(input)
							if (dragging and ((input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch))) then
								local FlatIdent_6D68E = 0;
								local percent;
								local value;
								while true do
									if (FlatIdent_6D68E == 0) then
										percent = math.clamp((input.Position.X - slideArea.AbsolutePosition.X) / slideArea.AbsoluteSize.X, 0, 1);
										value = math.floor(min + ((max - min) * percent) + 0.5);
										FlatIdent_6D68E = 1;
									end
									if (FlatIdent_6D68E == 1) then
										local FlatIdent_437D4 = 0;
										while true do
											if (FlatIdent_437D4 == 1) then
												FlatIdent_6D68E = 2;
												break;
											end
											if (FlatIdent_437D4 == 0) then
												fill.Size = UDim2.new(percent, 0, 1, 0);
												valLbl.Text = tostring(value);
												FlatIdent_437D4 = 1;
											end
										end
									end
									if (2 == FlatIdent_6D68E) then
										if callback then
											callback(value);
										end
										break;
									end
								end
							end
						end);
						FlatIdent_47A85 = 2;
					end
					if (FlatIdent_47A85 == 0) then
						dragging = false;
						slideArea.InputBegan:Connect(function(input)
							if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
								dragging = true;
							end
						end);
						FlatIdent_47A85 = 1;
					end
				end
			end
			if (FlatIdent_91B54 == 2) then
				local FlatIdent_1F138 = 0;
				while true do
					if (FlatIdent_1F138 == 2) then
						barBg.Parent = row;
						corner(barBg, 2);
						FlatIdent_1F138 = 3;
					end
					if (FlatIdent_1F138 == 0) then
						barBg.Size = UDim2.new(1, -24, 0, 4);
						barBg.Position = UDim2.new(0, 12, 1, -12);
						FlatIdent_1F138 = 1;
					end
					if (FlatIdent_1F138 == 1) then
						barBg.BackgroundColor3 = COLORS.line;
						barBg.BorderSizePixel = 0;
						FlatIdent_1F138 = 2;
					end
					if (FlatIdent_1F138 == 3) then
						FlatIdent_91B54 = 3;
						break;
					end
				end
			end
			if (FlatIdent_91B54 == 3) then
				local FlatIdent_8BF78 = 0;
				while true do
					if (FlatIdent_8BF78 == 1) then
						fill.BackgroundColor3 = COLORS.neon;
						fill.BorderSizePixel = 0;
						FlatIdent_8BF78 = 2;
					end
					if (0 == FlatIdent_8BF78) then
						fill = Instance.new("Frame");
						fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0);
						FlatIdent_8BF78 = 1;
					end
					if (FlatIdent_8BF78 == 3) then
						FlatIdent_91B54 = 4;
						break;
					end
					if (FlatIdent_8BF78 == 2) then
						fill.Parent = barBg;
						corner(fill, 2);
						FlatIdent_8BF78 = 3;
					end
				end
			end
			if (FlatIdent_91B54 == 4) then
				slideArea = Instance.new("TextButton");
				slideArea.Size = UDim2.new(1, -24, 0, 20);
				slideArea.Position = UDim2.new(0, 12, 1, -20);
				slideArea.BackgroundTransparency = 1;
				slideArea.Text = "";
				slideArea.Parent = row;
				FlatIdent_91B54 = 5;
			end
			if (FlatIdent_91B54 == 1) then
				local FlatIdent_31791 = 0;
				while true do
					if (1 == FlatIdent_31791) then
						valLbl.TextSize = 12;
						valLbl.TextXAlignment = Enum.TextXAlignment.Right;
						FlatIdent_31791 = 2;
					end
					if (FlatIdent_31791 == 2) then
						valLbl.Parent = row;
						barBg = Instance.new("Frame");
						FlatIdent_31791 = 3;
					end
					if (FlatIdent_31791 == 3) then
						FlatIdent_91B54 = 2;
						break;
					end
					if (FlatIdent_31791 == 0) then
						valLbl.TextColor3 = COLORS.neon;
						valLbl.Font = FONT;
						FlatIdent_31791 = 1;
					end
				end
			end
			if (FlatIdent_91B54 == 0) then
				local FlatIdent_62CB4 = 0;
				while true do
					if (1 == FlatIdent_62CB4) then
						valLbl.Size = UDim2.new(0, 40, 0, 20);
						valLbl.Position = UDim2.new(1, -50, 0, 8);
						FlatIdent_62CB4 = 2;
					end
					if (FlatIdent_62CB4 == 2) then
						valLbl.BackgroundTransparency = 1;
						valLbl.Text = tostring(default);
						FlatIdent_62CB4 = 3;
					end
					if (FlatIdent_62CB4 == 3) then
						FlatIdent_91B54 = 1;
						break;
					end
					if (FlatIdent_62CB4 == 0) then
						row = makeRow(parentTab, label, nil, 48);
						valLbl = Instance.new("TextLabel");
						FlatIdent_62CB4 = 1;
					end
				end
			end
		end
	end;
	Library.CreateTextBox = function(self, parentTab, label, default, callback)
		local FlatIdent_3F7F4 = 0;
		local row;
		local box;
		while true do
			if (FlatIdent_3F7F4 == 1) then
				local FlatIdent_16F8D = 0;
				while true do
					if (FlatIdent_16F8D == 1) then
						box.PlaceholderText = "Nhập...";
						box.Text = default or "";
						FlatIdent_16F8D = 2;
					end
					if (FlatIdent_16F8D == 0) then
						box.BackgroundColor3 = COLORS.panel;
						box.TextColor3 = COLORS.text;
						FlatIdent_16F8D = 1;
					end
					if (FlatIdent_16F8D == 2) then
						FlatIdent_3F7F4 = 2;
						break;
					end
				end
			end
			if (FlatIdent_3F7F4 == 0) then
				local FlatIdent_2C010 = 0;
				while true do
					if (FlatIdent_2C010 == 2) then
						FlatIdent_3F7F4 = 1;
						break;
					end
					if (FlatIdent_2C010 == 1) then
						box.Size = UDim2.new(1, -24, 0, 24);
						box.Position = UDim2.new(0, 12, 1, -32);
						FlatIdent_2C010 = 2;
					end
					if (FlatIdent_2C010 == 0) then
						row = makeRow(parentTab, label, nil, 52);
						box = Instance.new("TextBox");
						FlatIdent_2C010 = 1;
					end
				end
			end
			if (2 == FlatIdent_3F7F4) then
				box.Font = FONT;
				box.TextSize = 11;
				box.ClearTextOnFocus = false;
				box.Parent = row;
				FlatIdent_3F7F4 = 3;
			end
			if (FlatIdent_3F7F4 == 3) then
				local FlatIdent_24237 = 0;
				while true do
					if (FlatIdent_24237 == 0) then
						corner(box, 4);
						stroke(box, COLORS.line, 1, 0);
						FlatIdent_24237 = 1;
					end
					if (FlatIdent_24237 == 1) then
						box.FocusLost:Connect(function()
							if callback then
								callback(box.Text);
							end
						end);
						return row;
					end
				end
			end
		end
	end;
	return Library;
end;
return Library;
