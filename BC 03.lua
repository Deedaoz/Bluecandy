local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/UILib/main/source"))();

lib:SetTitle("Bluecandy 02") -- name <string>

local tab1 = lib:NewTab("Character", "Placeholder") -- name <string> description <string>
local tab2 = lib:NewTab("Misc", "Random shit") -- name <string> description <string>
local tab3 = lib:NewTab("Effects", "Effects cast on yourself!") -- name <string> description <string>
local tab4 = lib:NewTab("Lightsaber", "Lightsaber effects!") -- name <string> description <string>
local tab5 = lib:NewTab("Combat", "Combat based scripts!") -- name <string> description <string>
local tab6 = lib:NewTab("Teleports", "Teleport Locations!!") -- name <string> description <string>
local tab7 = lib:NewTab("Hubs", "Any useful hubs!") -- name <string> description <string>

tab1:NewSlider("WalkSpeed",16,500,16,function(value) -- name <string> minimum <number> maximium <number> default <number> callback <function>
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
tab1:NewButton("Change WalkSpeed to 50",function()-- name <string> callback <function>
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

tab2:NewButton("Shiftlock",16,500,16,function(value)
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()
   
    game:GetService('Players').LocalPlayer.DevEnableMouseLock = true
end)

tab2:NewButton("Debug Zoom",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()
    
    local player = game.Players.LocalPlayer
 
player.CameraMaxZoomDistance = 6000
player.CameraMinZoomDistance = 0
end)

tab3:NewButton("Invisible",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    local LP = game.Players.LocalPlayer
    local Character = LP.Character
    if LP.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        local Clone = Character.HumanoidRootPart:Clone()
        Character.HumanoidRootPart:Destroy()
        Clone.Parent = Character
    else
        local Clone = Character.LowerTorso.Root:Clone()
        Character.LowerTorso.Root:Destroy()
        Clone.Parent = Character.LowerTorso
    end
end)

tab3:NewButton("Autoheal",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
		music3:play()
    while wait() do
        local A_1 = true
        local Event = game:GetService("ReplicatedStorage").Events.toggleHealing
        Event:FireServer(A_1)
    end
end)


tab3:NewButton("Inf Stamina/Force",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
		music3:play()
		local RunService = game:GetService("RunService")
		RunService.Heartbeat:Connect(function()
			local plr = game.Players.LocalPlayer
			local chr = plr.Character
			local env1 = getsenv(plr.Backpack.Force.Client)
			env1.forceLevel = math.huge
		end)
		RunService.Heartbeat:Connect(function()
			local plr = game.Players.LocalPlayer
			local chr = plr.Character
			local env = getsenv(chr.Lightsaber.Client)
			env.stamina = math.huge
		end)
    end)

    tab3:NewButton("Anti-Freeze",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip

		music3:Play()
		for i,v in pairs(game:GetDescendants()) do
			v.ChildRemoved:Connect(function(e)
			end)
		end

		local function bruh()
			local AnimationTracks = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()

			for i, track in pairs (AnimationTracks) do
				track:Stop()
			end    
		end
		local plrs = game.Players.LocalPlayer.Character
		spawn(function()
			for i,v in pairs(plrs:GetDescendants()) do
				v.ChildAdded:Connect(function(e)
					if e.Name == "forceFreezeEffect" or e.Name == "FakeBPVelocity" then
						wait(0.001)
						local toolname =  "Lightsaber"
						game.Players.LocalPlayer.Backpack:FindFirstChild(toolname).Parent = game.Players.LocalPlayer.Character
						game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("forceFreezeEffect"):Destroy()
						game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FakeBPVelocity"):Destroy()
						game.Workspace.Camera.ColorCorrection:Destroy()
						game.Players.LocalPlayer.Character.HumanoidRootPart.forceFreeze:Stop()
						game.Players.LocalPlayer.Character.localForceEffects.vignette:Destroy()
						game.Players.LocalPlayer.Character.localForceEffects:Destroy()
						for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
							if v.Name == "vignette" then
								v:Destroy()
							end
							if v:IsA("Sound") then v:Destroy() end    
						end
						game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
						bruh()
					end
				end)
			end
		end)
    end)

    tab3:NewButton("Amogus Fling",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip

		music3:Play()
        
        
        local netboost = 1000 --velocity 
		--netboost usage: 
		--set to false to disable
		--set to a vector3 value if you dont want the velocity to change
		--set to a number to change the velocity in real time with magnitude equal to the number
		local idleMag = 0.005 --used only in case netboost is set to a number value
		--if magnitude of the real velocity of a part is lower than this
		--then the fake velocity is being set to Vector3.new(0, netboost, 0)
		--the lower value the less you jitter but you might loose network ownership
		local simradius = "shp" --simulation radius (net bypass) method
		--"shp" - sethiddenproperty
		--"ssr" - setsimulationradius
		--false - disable
		local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
		local newanimate = false --disables the animate script and enables after reanimation
		local discharscripts = true --disables all localScripts parented to your character before reanimation
		local R15toR6 = true --tries to convert your character to r6 if its r15
		local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
		local loadtime = game:GetService("Players").RespawnTime + 0.5 --anti respawn delay
		local method = 3 --reanimation method
		--methods:
		--0 - breakJoints (takes [loadtime] seconds to laod)
		--1 - limbs
		--2 - limbs + anti respawn
		--3 - limbs + breakJoints after [loadtime] seconds
		--4 - remove humanoid + breakJoints
		--5 - remove humanoid + limbs
		local alignmode = 2 --AlignPosition mode
		--modes:
		--1 - AlignPosition rigidity enabled true
		--2 - 2 AlignPositions rigidity enabled both true and false
		--3 - AlignPosition rigidity enabled false
		local hedafterneck = true --disable aligns for head and enable after neck is removed

		local lp = game:GetService("Players").LocalPlayer
		local rs = game:GetService("RunService")
		local stepped = rs.Stepped
		local heartbeat = rs.Heartbeat
		local renderstepped = rs.RenderStepped
		local sg = game:GetService("StarterGui")
		local ws = game:GetService("Workspace")
		local cf = CFrame.new
		local v3 = Vector3.new
		local v3_0 = v3(0, 0, 0)
		local inf = math.huge

		local c = lp.Character

		if not (c and c.Parent) then
			return
		end

		for i, v in pairs(c:GetDescendants()) do
			if v:IsA("CharacterMesh") or v:IsA("SpecialMesh") then
				v:Destroy()
			end
		end

		c:GetPropertyChangedSignal("Parent"):Connect(function()
			if not (c and c.Parent) then
				c = nil
			end
		end)

		local function gp(parent, name, className)
			local ret = nil
			pcall(function()
				for i, v in pairs(parent:GetChildren()) do
					if (v.Name == name) and v:IsA(className) then
						ret = v
						break
					end
				end
			end)
			return ret
		end

		local function align(Part0, Part1)
			Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001, 0.0001, 0.0001)

			local att0 = Instance.new("Attachment", Part0)
			att0.Orientation = v3_0
			att0.Position = v3_0
			att0.Name = "att0_" .. Part0.Name
			local att1 = Instance.new("Attachment", Part1)
			att1.Orientation = v3_0
			att1.Position = v3_0
			att1.Name = "att1_" .. Part1.Name

			if (alignmode == 1) or (alignmode == 2) then
				local ape = Instance.new("AlignPosition", att0)
				ape.ApplyAtCenterOfMass = false
				ape.MaxForce = inf
				ape.MaxVelocity = inf
				ape.ReactionForceEnabled = false
				ape.Responsiveness = 200
				ape.Attachment1 = att1
				ape.Attachment0 = att0
				ape.Name = "AlignPositionRtrue"
				ape.RigidityEnabled = true
			end

			if (alignmode == 2) or (alignmode == 3) then
				local apd = Instance.new("AlignPosition", att0)
				apd.ApplyAtCenterOfMass = false
				apd.MaxForce = inf
				apd.MaxVelocity = inf
				apd.ReactionForceEnabled = false
				apd.Responsiveness = 200
				apd.Attachment1 = att1
				apd.Attachment0 = att0
				apd.Name = "AlignPositionRfalse"
				apd.RigidityEnabled = false
			end

			local ao = Instance.new("AlignOrientation", att0)
			ao.MaxAngularVelocity = inf
			ao.MaxTorque = inf
			ao.PrimaryAxisOnly = false
			ao.ReactionTorqueEnabled = false
			ao.Responsiveness = 200
			ao.Attachment1 = att1
			ao.Attachment0 = att0
			ao.RigidityEnabled = false

			if netboost then
				Part0:GetPropertyChangedSignal("Parent"):Connect(function()
					if not (Part0 and Part0.Parent) then
						Part0 = nil
					end
				end)
				spawn(function()
					if typeof(netboost) == "Vector3" then
						local vel = v3_0
						local rotvel = v3_0
						while Part0 do
							Part0.Velocity = vel
							Part0.RotVelocity = rotvel
							heartbeat:Wait()
							if Part0 then
								vel = Part0.Velocity
								Part0.Velocity = netboost
								Part0.RotVelocity = v3_0
								stepped:Wait()
							end
						end
					elseif typeof(netboost) == "number" then
						local vel = v3_0
						local rotvel = v3_0
						while Part0 do
							Part0.Velocity = vel
							Part0.RotVelocity = rotvel
							heartbeat:Wait()
							if Part0 then
								local newvel = vel
								local mag = newvel.Magnitude
								if mag < idleMag then
									newvel = v3(0, netboost, 0)
								else
									local multiplier = netboost / mag
									newvel *= v3(multiplier,  multiplier, multiplier)
								end
								vel = Part0.Velocity
								rotvel = Part0.RotVelocity
								Part0.Velocity = newvel
								Part0.RotVelocity = v3_0
								stepped:Wait()
							end
						end
					end
				end)
			end
		end

		local function respawnrequest()
			local c = lp.Character
			local ccfr = ws.CurrentCamera.CFrame
			local fc = Instance.new("Model")
			local nh = Instance.new("Humanoid", fc)
			lp.Character = fc
			nh.Health = 0
			lp.Character = c
			fc:Destroy()
			local con = nil
			local function confunc()
				con:Disconnect()
				ws.CurrentCamera.CFrame = ccfr
			end
			con = renderstepped:Connect(confunc)
		end

		local destroyhum = (method == 4) or (method == 5)
		local breakjoints = (method == 0) or (method == 4)
		local antirespawn = (method == 0) or (method == 2) or (method == 3)

		addtools = addtools and gp(lp, "Backpack", "Backpack")

		if simradius == "shp" then
			local shp = sethiddenproperty or set_hidden_property or set_hidden_prop or sethiddenprop
			if shp then
				spawn(function()
					while c and heartbeat:Wait() do
						shp(lp, "SimulationRadius", inf)
					end
				end)
			end
		elseif simradius == "ssr" then
			local ssr = setsimulationradius or set_simulation_radius or set_sim_radius or setsimradius or set_simulation_rad or setsimulationrad
			if ssr then
				spawn(function()
					while c and heartbeat:Wait() do
						ssr(inf)
					end
				end)
			end
		end

		antiragdoll = antiragdoll and function(v)
			if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then
				v.Parent = nil
			end
		end

		if antiragdoll then
			for i, v in pairs(c:GetDescendants()) do
				antiragdoll(v)
			end
			c.DescendantAdded:Connect(antiragdoll)
		end

		if antirespawn then
			respawnrequest()
		end

		if method == 0 then
			wait(loadtime)
			if not c then
				return
			end
		end

		if discharscripts then
			for i, v in pairs(c:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = true
				end
			end
		elseif newanimate then
			local animate = gp(c, "Animate", "LocalScript")
			if animate and (not animate.Disabled) then
				animate.Disabled = true
			else
				newanimate = false
			end
		end

		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then
			for i, v in pairs(hum:GetPlayingAnimationTracks()) do
				v:Stop()
			end
		end

		if addtools then
			for i, v in pairs(addtools:GetChildren()) do
				if v:IsA("Tool") then
					v.Parent = c
				end
			end
		end

		pcall(function()
			settings().Physics.AllowSleep = false
			settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		end)

		local OLDscripts = {}

		for i, v in pairs(c:GetDescendants()) do
			if v.ClassName == "Script" then
				table.insert(OLDscripts, v)
			end
		end

		local scriptNames = {}

		for i, v in pairs(c:GetDescendants()) do
			if v:IsA("BasePart") then
				local newName = tostring(i)
				local exists = true
				while exists do
					exists = false
					for i, v in pairs(OLDscripts) do
						if v.Name == newName then
							exists = true
						end
					end
					if exists then
						newName = newName .. "_"    
					end
				end
				table.insert(scriptNames, newName)
				Instance.new("Script", v).Name = newName
			end
		end

		c.Archivable = true
		local cl = c:Clone()
		for i, v in pairs(cl:GetDescendants()) do
			pcall(function()
				v.Transparency = 1
				v.Anchored = false
			end)
		end

		local model = Instance.new("Model", c)
		model.Name = model.ClassName

		model:GetPropertyChangedSignal("Parent"):Connect(function()
			if not (model and model.Parent) then
				model = nil
			end
		end)

		for i, v in pairs(c:GetChildren()) do
			if v ~= model then
				if destroyhum and v:IsA("Humanoid") then
					v:Destroy()
				else
					if addtools and v:IsA("Tool") then
						for i1, v1 in pairs(v:GetDescendants()) do
							if v1 and v1.Parent and v1:IsA("BasePart") then
								local bv = Instance.new("BodyVelocity", v1)
								bv.Velocity = v3_0
								bv.MaxForce = v3(1000, 1000, 1000)
								bv.P = 1250
								bv.Name = "bv_" .. v.Name
							end
						end
					end
					v.Parent = model
				end
			end
		end
		local head = gp(model, "Head", "BasePart")
		local torso = gp(model, "Torso", "BasePart") or gp(model, "UpperTorso", "BasePart")
		if breakjoints then
			model:BreakJoints()
		else
			if head and torso then
				for i, v in pairs(model:GetDescendants()) do
					if v:IsA("Weld") or v:IsA("Snap") or v:IsA("Glue") or v:IsA("Motor") or v:IsA("Motor6D") then
						local save = false
						if (v.Part0 == torso) and (v.Part1 == head) then
							save = true
						end
						if (v.Part0 == head) and (v.Part1 == torso) then
							save = true
						end
						if save then
							if hedafterneck then
								hedafterneck = v
							end
						else
							v:Destroy()
						end
					end
				end
			end
			if method == 3 then
				spawn(function()
					wait(loadtime)
					if model then
						model:BreakJoints()
					end
				end)
			end
		end

		cl.Parent = c
		for i, v in pairs(cl:GetChildren()) do
			v.Parent = c
		end
		cl:Destroy()

		local modelDes = {}
		for i, v in pairs(model:GetDescendants()) do
			if v:IsA("BasePart") then
				i = tostring(i)
				local con = nil
				con = v:GetPropertyChangedSignal("Parent"):Connect(function()
					if not (v and v.Parent) then
						con:Disconnect()
						modelDes[i] = nil
					end
				end)
				modelDes[i] = v
			end
		end
		local modelcolcon = nil
		local function modelcolf()
			if model then
				for i, v in pairs(modelDes) do
					v.CanCollide = false
				end
			else
				modelcolcon:Disconnect()
			end
		end
		modelcolcon = stepped:Connect(modelcolf)
		modelcolf()

		for i, scr in pairs(model:GetDescendants()) do
			if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
				local Part0 = scr.Parent
				if Part0:IsA("BasePart") then
					for i1, scr1 in pairs(c:GetDescendants()) do
						if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
							local Part1 = scr1.Parent
							if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
								align(Part0, Part1)
								break
							end
						end
					end
				end
			end
		end

		if (typeof(hedafterneck) == "Instance") and head and head.Parent then
			local aligns = {}
			for i, v in pairs(head:GetDescendants()) do
				if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
					table.insert(aligns, v)
					v.Enabled = false
				end
			end
			spawn(function()
				while c and hedafterneck and hedafterneck.Parent do
					stepped:Wait()
				end
				if not (c and head and head.Parent) then
					return
				end
				for i, v in pairs(aligns) do
					pcall(function()
						v.Enabled = true
					end)
				end
			end)
		end

		for i, v in pairs(c:GetDescendants()) do
			if v and v.Parent then
				if v.ClassName == "Script" then
					if table.find(scriptNames, v.Name) then
						v:Destroy()
					end
				elseif not v:IsDescendantOf(model) then
					if v:IsA("Decal") then
						v.Transparency = 1
					elseif v:IsA("ForceField") then
						v.Visible = false
					elseif v:IsA("Sound") then
						v.Playing = false
					elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
						v.Enabled = false
					end
				end
			end
		end

		if newanimate then
			local animate = gp(c, "Animate", "LocalScript")
			if animate then
				animate.Disabled = false
			end
		end

		if addtools then
			for i, v in pairs(c:GetChildren()) do
				if v:IsA("Tool") then
					v.Parent = addtools
				end
			end
		end

		local hum0 = model:FindFirstChildOfClass("Humanoid")
		local hum1 = c:FindFirstChildOfClass("Humanoid")
		if hum1 then
			ws.CurrentCamera.CameraSubject = hum1
			local camSubCon = nil
			local function camSubFunc()
				camSubCon:Disconnect()
				if c and hum1 and (hum1.Parent == c) then
					ws.CurrentCamera.CameraSubject = hum1
				end
			end
			camSubCon = renderstepped:Connect(camSubFunc)
			if hum0 then
				hum0.Changed:Connect(function(prop)
					if (prop == "Jump") and hum1 and hum1.Parent then
						hum1.Jump = hum0.Jump
					end
				end)
			else
				lp.Character = nil
				lp.Character = c
			end
		end

		local rb = Instance.new("BindableEvent", c)
		rb.Event:Connect(function()
			rb:Destroy()
			sg:SetCore("ResetButtonCallback", true)
			if destroyhum then
				c:BreakJoints()
				return
			end
			if antirespawn then
				if hum0 and hum0.Parent and (hum0.Health > 0) then
					model:BreakJoints()
					hum0.Health = 0
				end
				respawnrequest()
			else
				if hum0 and hum0.Parent and (hum0.Health > 0) then
					model:BreakJoints()
					hum0.Health = 0
				end
			end
		end)
		sg:SetCore("ResetButtonCallback", rb)

		spawn(function()
			while c do
				if hum0 and hum0.Parent and hum1 and hum1.Parent then
					hum1.Jump = hum0.Jump
				end
				wait()
			end
			sg:SetCore("ResetButtonCallback", true)
		end)

		R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
		if R15toR6 then
			local cfr = nil
			pcall(function()
				cfr = gp(c, "HumanoidRootPart", "BasePart").CFrame
			end)
			if cfr then
				local R6parts = { 
					head = {
						Name = "Head",
						Size = v3(2, 1, 1),
						R15 = {
							Head = 0
						}
					},
					torso = {
						Name = "Torso",
						Size = v3(2, 2, 1),
						R15 = {
							UpperTorso = 0.2,
							LowerTorso = -0.8
						}
					},
					root = {
						Name = "HumanoidRootPart",
						Size = v3(2, 2, 1),
						R15 = {
							HumanoidRootPart = 0
						}
					},
					leftArm = {
						Name = "Left Arm",
						Size = v3(1, 2, 1),
						R15 = {
							LeftHand = -0.85,
							LeftLowerArm = -0.2,
							LeftUpperArm = 0.4
						}
					},
					rightArm = {
						Name = "Right Arm",
						Size = v3(1, 2, 1),
						R15 = {
							RightHand = -0.85,
							RightLowerArm = -0.2,
							RightUpperArm = 0.4
						}
					},
					leftLeg = {
						Name = "Left Leg",
						Size = v3(1, 2, 1),
						R15 = {
							LeftFoot = -0.85,
							LeftLowerLeg = -0.15,
							LeftUpperLeg = 0.6
						}
					},
					rightLeg = {
						Name = "Right Leg",
						Size = v3(1, 2, 1),
						R15 = {
							RightFoot = -0.85,
							RightLowerLeg = -0.15,
							RightUpperLeg = 0.6
						}
					}
				}
				for i, v in pairs(c:GetChildren()) do
					if v:IsA("BasePart") then
						for i1, v1 in pairs(v:GetChildren()) do
							if v1:IsA("Motor6D") then
								v1.Part0 = nil
							end
						end
					end
				end
				for i, v in pairs(R6parts) do
					local part = Instance.new("Part")
					part.Name = v.Name
					part.Size = v.Size
					part.CFrame = cfr
					part.Anchored = false
					part.Transparency = 1
					part.CanCollide = false
					for i1, v1 in pairs(v.R15) do
						local R15part = gp(c, i1, "BasePart")
						local att = gp(R15part, "att1_" .. i1, "Attachment")
						if R15part then
							local weld = Instance.new("Weld", R15part)
							weld.Name = "Weld_" .. i1
							weld.Part0 = part
							weld.Part1 = R15part
							weld.C0 = cf(0, v1, 0)
							weld.C1 = cf(0, 0, 0)
							R15part.Massless = true
							R15part.Name = "R15_" .. i1
							R15part.Parent = part
							if att then
								att.Parent = part
								att.Position = v3(0, v1, 0)
							end
						end
					end
					part.Parent = c
					R6parts[i] = part
				end
				local R6joints = {
					neck = {
						Parent = R6parts.torso,
						Name = "Neck",
						Part0 = R6parts.torso,
						Part1 = R6parts.head,
						C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
						C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
					},
					rootJoint = {
						Parent = R6parts.root,
						Name = "RootJoint" ,
						Part0 = R6parts.root,
						Part1 = R6parts.torso,
						C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
						C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
					},
					rightShoulder = {
						Parent = R6parts.torso,
						Name = "Right Shoulder",
						Part0 = R6parts.torso,
						Part1 = R6parts.rightArm,
						C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
						C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					},
					leftShoulder = {
						Parent = R6parts.torso,
						Name = "Left Shoulder",
						Part0 = R6parts.torso,
						Part1 = R6parts.leftArm,
						C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
						C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					},
					rightHip = {
						Parent = R6parts.torso,
						Name = "Right Hip",
						Part0 = R6parts.torso,
						Part1 = R6parts.rightLeg,
						C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
						C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					},
					leftHip = {
						Parent = R6parts.torso,
						Name = "Left Hip" ,
						Part0 = R6parts.torso,
						Part1 = R6parts.leftLeg,
						C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
						C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					}
				}
				for i, v in pairs(R6joints) do
					local joint = Instance.new("Motor6D")
					for prop, val in pairs(v) do
						joint[prop] = val
					end
					R6joints[i] = joint
				end
				hum1.RigType = Enum.HumanoidRigType.R6
				hum1.HipHeight = 0
			end
		end

		wait()
		if not c then
			return
		end

		local venttoggle = false
		local vented = false
		local mode2 = false
		local attack = false
		local modetoggle = false
		local dead = false
		local dtoggle = false
		local sittoggle = false
		local sit = false
		local sine = 0
		local mouse = lp:GetMouse()

		local joints = {
			["RootJoint"] = "",
			["Neck"] = "",
			["Right Hip"] = "",
			["Left Hip"] = "",
			["Left Shoulder"] = "",
			["Right Shoulder"] = ""
		}

		for i, v in pairs(c:GetDescendants()) do
			if v:IsA("Motor6D") and (joints[v.Name] == "") and (not v:IsDescendantOf(model)) then
				joints[v.Name] = v
			end
		end

		for i, v in pairs(joints) do
			if v and (v ~= "") then
				v.C0 = cf(0, 0, 0)
				v.C1 = cf(0, 0, 0)
			else
				return
			end
		end

		local Root = gp(c, "HumanoidRootPart", "BasePart")
		if not Root then
			return
		end

		local function replace(a)
			local b, c = a.Part0, a.Part1
			a.Part1, a.Part0 = b, c
		end

		replace(joints["Left Shoulder"])
		replace(joints["Right Shoulder"])
		replace(joints["Left Hip"])
		replace(joints["Right Hip"])

		for i, v in pairs(c:GetChildren()) do
			if v:IsA("Accessory") then
				v:Destroy()
			end
		end

		joints.Neck.C0 = cf(0, 0.3, -0.5)

		mouse.Button1Down:Connect(function()
			if not (kill or mode2 or dead) then
				attack = true
				vented = false
				hum1.WalkSpeed = 0
				wait(0.5)
				hum1.WalkSpeed = 16
				attack = false
			end
		end)

		mouse.KeyDown:Connect(function(key)
			if not c then 
				return 
			end
			key = key:lower()
			if k == "e" then
				if not venttoggle then
					modetoggle = false
					mode2 = false
					venttoggle = true
					vented = true
					hum1.WalkSpeed = 100
					position = "ventidle"
				elseif venttoggle then
					venttoggle = false
					vented = false
					hum1.WalkSpeed = 16
				end
			elseif key == "f" then
				if not modetoggle then
					venttoggle = false
					vented = false
					modetoggle = true
					mode2 = true
					sittoggle = false
					sit = false
					hum1.WalkSpeed = 60
				elseif modetoggle then
					modetoggle = false
					mode2 = false
					hum1.WalkSpeed = 16
				end
			elseif key == "q" then
				if dtoggle == false then
					venttoggle = false
					vented = false
					modetoggle = false
					mode2 = false
					dtoggle = true
					dead = true
					sittoggle = false
					sit = false
					hum1.WalkSpeed = 0
				elseif dtoggle == true then
					dtoggle = false
					dead = false
					hum1.WalkSpeed = 16
				end
			elseif key == "c" then
				if sittoggle == false then
					venttoggle = false
					vented = false
					modetoggle = false
					mode2 = false
					dtoggle = false
					dead = false
					sittoggle = true
					sit = true
					hum1.WalkSpeed = 0
				elseif sittoggle == true then
					sittoggle = false
					sit = false
					hum1.WalkSpeed = 16
				end
			end
		end)

		local pose = "idle"
		while stepped:Wait() and c do
			if attack then
				pose = "attack"
			elseif dead then
				pose = "dead"
			elseif sit then
				pose = "sit"
			elseif mode2 then
				if Root.Velocity.Magnitude < 2 then
					pose = "idle2"
				elseif Root.Velocity.Magnitude > 20 then
					pose = "walk2"
				end
			else
				if Root.Velocity.y > 1 then
					pose = "jump"
				elseif Root.Velocity.y < -1 then
					pose = "fall"
				elseif Root.Velocity.Magnitude < 2 then
					pose = "idle"
				elseif Root.Velocity.Magnitude < 20 then
					pose = "walk"
				elseif Root.Velocity.Magnitude > 20 then
					pose = "run"
				end 
			end
			sine += 1
			if pose == "idle" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0.3 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 10 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 10 * math.sin(sine/12)), math.rad(20 + 0 * math.sin(sine/12)), math.rad(-3 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 10 * math.sin(sine/12)), math.rad(-20 + 0 * math.sin(sine/12)), math.rad(3 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "walk" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0.3 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(-10 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + 0.3 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 30 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0.3 * math.sin(sine/12), 0.3 + -0.3 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + -30 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "jump" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(15 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(10 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "fall" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(15 + 10 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(-10 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(10 + 5 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(10 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "vent" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), 0 + -8 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 1.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(26.02 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "ventidle" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/12), -20 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/12), 1.5 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(26.02 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "idle2" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/20), 3 + 0.3 * math.sin(sine/20), 0 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(0 + 20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.5 + 0 * math.sin(sine/20), 1 + 0 * math.sin(sine/20), 1 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(20 + -20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/20), 2 + 0 * math.sin(sine/20), 0.5 + -0.5 * math.sin(sine/20)) * CFrame.Angles(math.rad(10 + -20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
			elseif pose == "walk2" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/20), 3 + 0.3 * math.sin(sine/20), 0 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(-60 + 10 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/20), 2 + 0 * math.sin(sine/20), 0.3 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(0 + -10 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(-5 + 0 * math.sin(sine/20))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.5 + 0 * math.sin(sine/20), 1 + 0 * math.sin(sine/20), 0.5 + 0 * math.sin(sine/20)) * CFrame.Angles(math.rad(0 + -20 * math.sin(sine/20)), math.rad(0 + 0 * math.sin(sine/20)), math.rad(5 + 0 * math.sin(sine/20))),0.1)
			elseif pose == "attack" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/5), 0 + 0 * math.sin(sine/5), 0 + 0 * math.sin(sine/5)) * CFrame.Angles(math.rad(30 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(30 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(-4 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 2 + 0 * math.sin(sine/12), 0.5 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(30 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(4 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "sit" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/5), -1.8 + 0 * math.sin(sine/5), 0 + 0 * math.sin(sine/5)) * CFrame.Angles(math.rad(10 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), -1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(-90 + 0 * math.sin(sine/12)), math.rad(10 + 0 * math.sin(sine/12)), math.rad(-4 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 1 + 0 * math.sin(sine/12), -1 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(-90 + 0 * math.sin(sine/12)), math.rad(-10 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
			elseif pose == "dead" then
				joints["RootJoint"].C0 = joints["RootJoint"].C0:lerp(CFrame.new(0 + 0 * math.sin(sine/5), -2.5 + 0 * math.sin(sine/5), -1 + 0 * math.sin(sine/5)) * CFrame.Angles(math.rad(-90 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5)), math.rad(0 + 0 * math.sin(sine/5))),0.1)
				joints["Right Hip"].C0 = joints["Right Hip"].C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 3 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(-4 + 0 * math.sin(sine/12))),0.1)
				joints["Left Hip"].C0 = joints["Left Hip"].C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 3 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(4 + 0 * math.sin(sine/12))),0.1)
			end
			joints["Right Shoulder"].C0 = joints["Right Shoulder"].C0:lerp(CFrame.new(-0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
			joints["Left Shoulder"].C0 = joints["Left Shoulder"].C0:lerp(CFrame.new(0.4 + 0 * math.sin(sine/12), 0 + 0 * math.sin(sine/12), -0.8 + 0 * math.sin(sine/12)) * CFrame.Angles(math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12)), math.rad(0 + 0 * math.sin(sine/12))),0.1)
		end
    end)

    tab3:NewButton("Gus Fling",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()
        
        
        
        local netboost = 5000 --velocity 

		local idleMag = 0.005 --used only in case netboost is set to a number value

		local simradius = "shp" --simulation radius (net bypass) method

		local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
		local newanimate = false --disables the animate script and enables after reanimation
		local discharscripts = true --disables all localScripts parented to your character before reanimation
		local R15toR6 = true --tries to convert your character to r6 if its r15
		local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
		local loadtime = game:GetService("Players").RespawnTime + 0.5 --anti respawn delay
		local method = 3 --reanimation method

		local alignmode = 2 --AlignPosition mode

		local hedafterneck = true --disable aligns for head and enable after neck is removed

		local lp = game:GetService("Players").LocalPlayer
		local rs = game:GetService("RunService")
		local stepped = rs.Stepped
		local heartbeat = rs.Heartbeat
		local renderstepped = rs.RenderStepped
		local sg = game:GetService("StarterGui")
		local ws = game:GetService("Workspace")
		local cf = CFrame.new
		local v3 = Vector3.new
		local v3_0 = v3(0, 0, 0)
		local inf = math.huge

		local c = lp.Character

		if not (c and c.Parent) then
			return
		end

		for i, v in pairs(c:GetDescendants()) do
			if v:IsA("CharacterMesh") or v:IsA("SpecialMesh") then
				v:Destroy()
			end
		end

		c:GetPropertyChangedSignal("Parent"):Connect(function()
			if not (c and c.Parent) then
				c = nil
			end
		end)

		local function gp(parent, name, className)
			local ret = nil
			pcall(function()
				for i, v in pairs(parent:GetChildren()) do
					if (v.Name == name) and v:IsA(className) then
						ret = v
						break
					end
				end
			end)
			return ret
		end

		local function align(Part0, Part1)
			Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001, 0.0001, 0.0001)

			local att0 = Instance.new("Attachment", Part0)
			att0.Orientation = v3_0
			att0.Position = v3_0
			att0.Name = "att0_" .. Part0.Name
			local att1 = Instance.new("Attachment", Part1)
			att1.Orientation = v3_0
			att1.Position = v3_0
			att1.Name = "att1_" .. Part1.Name

			if (alignmode == 1) or (alignmode == 2) then
				local ape = Instance.new("AlignPosition", att0)
				ape.ApplyAtCenterOfMass = false
				ape.MaxForce = inf
				ape.MaxVelocity = inf
				ape.ReactionForceEnabled = false
				ape.Responsiveness = 200
				ape.Attachment1 = att1
				ape.Attachment0 = att0
				ape.Name = "AlignPositionRtrue"
				ape.RigidityEnabled = true
			end

			if (alignmode == 2) or (alignmode == 3) then
				local apd = Instance.new("AlignPosition", att0)
				apd.ApplyAtCenterOfMass = false
				apd.MaxForce = inf
				apd.MaxVelocity = inf
				apd.ReactionForceEnabled = false
				apd.Responsiveness = 200
				apd.Attachment1 = att1
				apd.Attachment0 = att0
				apd.Name = "AlignPositionRfalse"
				apd.RigidityEnabled = false
			end

			local ao = Instance.new("AlignOrientation", att0)
			ao.MaxAngularVelocity = inf
			ao.MaxTorque = inf
			ao.PrimaryAxisOnly = false
			ao.ReactionTorqueEnabled = false
			ao.Responsiveness = 200
			ao.Attachment1 = att1
			ao.Attachment0 = att0
			ao.RigidityEnabled = false

			if netboost then
				Part0:GetPropertyChangedSignal("Parent"):Connect(function()
					if not (Part0 and Part0.Parent) then
						Part0 = nil
					end
				end)
				spawn(function()
					if typeof(netboost) == "Vector3" then
						local vel = v3_0
						local rotvel = v3_0
						while Part0 do
							Part0.Velocity = vel
							Part0.RotVelocity = rotvel
							heartbeat:Wait()
							if Part0 then
								vel = Part0.Velocity
								Part0.Velocity = netboost
								Part0.RotVelocity = v3_0
								stepped:Wait()
							end
						end
					elseif typeof(netboost) == "number" then
						local vel = v3_0
						local rotvel = v3_0
						while Part0 do
							Part0.Velocity = vel
							Part0.RotVelocity = rotvel
							heartbeat:Wait()
							if Part0 then
								local newvel = vel
								local mag = newvel.Magnitude
								if mag < idleMag then
									newvel = v3(0, netboost, 0)
								else
									local multiplier = netboost / mag
									newvel *= v3(multiplier,  multiplier, multiplier)
								end
								vel = Part0.Velocity
								rotvel = Part0.RotVelocity
								Part0.Velocity = newvel
								Part0.RotVelocity = v3_0
								stepped:Wait()
							end
						end
					end
				end)
			end
		end

		local function respawnrequest()
			local c = lp.Character
			local ccfr = ws.CurrentCamera.CFrame
			local fc = Instance.new("Model")
			local nh = Instance.new("Humanoid", fc)
			lp.Character = fc
			nh.Health = 0
			lp.Character = c
			fc:Destroy()
			local con = nil
			local function confunc()
				con:Disconnect()
				ws.CurrentCamera.CFrame = ccfr
			end
			con = renderstepped:Connect(confunc)
		end

		local destroyhum = (method == 4) or (method == 5)
		local breakjoints = (method == 0) or (method == 4)
		local antirespawn = (method == 0) or (method == 2) or (method == 3)

		addtools = addtools and gp(lp, "Backpack", "Backpack")

		if simradius == "shp" then
			local shp = sethiddenproperty or set_hidden_property or set_hidden_prop or sethiddenprop
			if shp then
				spawn(function()
					while c and heartbeat:Wait() do
						shp(lp, "SimulationRadius", inf)
					end
				end)
			end
		elseif simradius == "ssr" then
			local ssr = setsimulationradius or set_simulation_radius or set_sim_radius or setsimradius or set_simulation_rad or setsimulationrad
			if ssr then
				spawn(function()
					while c and heartbeat:Wait() do
						ssr(inf)
					end
				end)
			end
		end

		antiragdoll = antiragdoll and function(v)
			if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then
				v.Parent = nil
			end
		end

		if antiragdoll then
			for i, v in pairs(c:GetDescendants()) do
				antiragdoll(v)
			end
			c.DescendantAdded:Connect(antiragdoll)
		end

		if antirespawn then
			respawnrequest()
		end

		if method == 0 then
			wait(loadtime)
			if not c then
				return
			end
		end

		if discharscripts then
			for i, v in pairs(c:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = true
				end
			end
		elseif newanimate then
			local animate = gp(c, "Animate", "LocalScript")
			if animate and (not animate.Disabled) then
				animate.Disabled = true
			else
				newanimate = false
			end
		end

		local hum = c:FindFirstChildOfClass("Humanoid")
		if hum then
			for i, v in pairs(hum:GetPlayingAnimationTracks()) do
				v:Stop()
			end
		end

		if addtools then
			for i, v in pairs(addtools:GetChildren()) do
				if v:IsA("Tool") then
					v.Parent = c
				end
			end
		end

		pcall(function()
			settings().Physics.AllowSleep = false
			settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		end)

		local OLDscripts = {}

		for i, v in pairs(c:GetDescendants()) do
			if v.ClassName == "Script" then
				table.insert(OLDscripts, v)
			end
		end

		local scriptNames = {}

		for i, v in pairs(c:GetDescendants()) do
			if v:IsA("BasePart") then
				local newName = tostring(i)
				local exists = true
				while exists do
					exists = false
					for i, v in pairs(OLDscripts) do
						if v.Name == newName then
							exists = true
						end
					end
					if exists then
						newName = newName .. "_"    
					end
				end
				table.insert(scriptNames, newName)
				Instance.new("Script", v).Name = newName
			end
		end

		c.Archivable = true
		local cl = c:Clone()
		for i, v in pairs(cl:GetDescendants()) do
			pcall(function()
				v.Transparency = 1
				v.Anchored = false
			end)
		end

		local model = Instance.new("Model", c)
		model.Name = model.ClassName

		model:GetPropertyChangedSignal("Parent"):Connect(function()
			if not (model and model.Parent) then
				model = nil
			end
		end)

		for i, v in pairs(c:GetChildren()) do
			if v ~= model then
				if destroyhum and v:IsA("Humanoid") then
					v:Destroy()
				else
					if addtools and v:IsA("Tool") then
						for i1, v1 in pairs(v:GetDescendants()) do
							if v1 and v1.Parent and v1:IsA("BasePart") then
								local bv = Instance.new("BodyVelocity", v1)
								bv.Velocity = v3_0
								bv.MaxForce = v3(1000, 1000, 1000)
								bv.P = 1250
								bv.Name = "bv_" .. v.Name
							end
						end
					end
					v.Parent = model
				end
			end
		end
		local head = gp(model, "Head", "BasePart")
		local torso = gp(model, "Torso", "BasePart") or gp(model, "UpperTorso", "BasePart")
		if breakjoints then
			model:BreakJoints()
		else
			if head and torso then
				for i, v in pairs(model:GetDescendants()) do
					if v:IsA("Weld") or v:IsA("Snap") or v:IsA("Glue") or v:IsA("Motor") or v:IsA("Motor6D") then
						local save = false
						if (v.Part0 == torso) and (v.Part1 == head) then
							save = true
						end
						if (v.Part0 == head) and (v.Part1 == torso) then
							save = true
						end
						if save then
							if hedafterneck then
								hedafterneck = v
							end
						else
							v:Destroy()
						end
					end
				end
			end
			if method == 3 then
				spawn(function()
					wait(loadtime)
					if model then
						model:BreakJoints()
					end
				end)
			end
		end

		cl.Parent = c
		for i, v in pairs(cl:GetChildren()) do
			v.Parent = c
		end
		cl:Destroy()

		local modelDes = {}
		for i, v in pairs(model:GetDescendants()) do
			if v:IsA("BasePart") then
				i = tostring(i)
				local con = nil
				con = v:GetPropertyChangedSignal("Parent"):Connect(function()
					if not (v and v.Parent) then
						con:Disconnect()
						modelDes[i] = nil
					end
				end)
				modelDes[i] = v
			end
		end
		local modelcolcon = nil
		local function modelcolf()
			if model then
				for i, v in pairs(modelDes) do
					v.CanCollide = false
				end
			else
				modelcolcon:Disconnect()
			end
		end
		modelcolcon = stepped:Connect(modelcolf)
		modelcolf()

		for i, scr in pairs(model:GetDescendants()) do
			if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
				local Part0 = scr.Parent
				if Part0:IsA("BasePart") then
					for i1, scr1 in pairs(c:GetDescendants()) do
						if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
							local Part1 = scr1.Parent
							if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
								align(Part0, Part1)
								break
							end
						end
					end
				end
			end
		end

		if (typeof(hedafterneck) == "Instance") and head and head.Parent then
			local aligns = {}
			for i, v in pairs(head:GetDescendants()) do
				if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
					table.insert(aligns, v)
					v.Enabled = false
				end
			end
			spawn(function()
				while c and hedafterneck and hedafterneck.Parent do
					stepped:Wait()
				end
				if not (c and head and head.Parent) then
					return
				end
				for i, v in pairs(aligns) do
					pcall(function()
						v.Enabled = true
					end)
				end
			end)
		end

		for i, v in pairs(c:GetDescendants()) do
			if v and v.Parent then
				if v.ClassName == "Script" then
					if table.find(scriptNames, v.Name) then
						v:Destroy()
					end
				elseif not v:IsDescendantOf(model) then
					if v:IsA("Decal") then
						v.Transparency = 1
					elseif v:IsA("ForceField") then
						v.Visible = false
					elseif v:IsA("Sound") then
						v.Playing = false
					elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
						v.Enabled = false
					end
				end
			end
		end

		if newanimate then
			local animate = gp(c, "Animate", "LocalScript")
			if animate then
				animate.Disabled = false
			end
		end

		if addtools then
			for i, v in pairs(c:GetChildren()) do
				if v:IsA("Tool") then
					v.Parent = addtools
				end
			end
		end

		local hum0 = model:FindFirstChildOfClass("Humanoid")
		local hum1 = c:FindFirstChildOfClass("Humanoid")
		if hum1 then
			ws.CurrentCamera.CameraSubject = hum1
			local camSubCon = nil
			local function camSubFunc()
				camSubCon:Disconnect()
				if c and hum1 and (hum1.Parent == c) then
					ws.CurrentCamera.CameraSubject = hum1
				end
			end
			camSubCon = renderstepped:Connect(camSubFunc)
			if hum0 then
				hum0.Changed:Connect(function(prop)
					if (prop == "Jump") and hum1 and hum1.Parent then
						hum1.Jump = hum0.Jump
					end
				end)
			else
				lp.Character = nil
				lp.Character = c
			end
		end

		local rb = Instance.new("BindableEvent", c)
		rb.Event:Connect(function()
			rb:Destroy()
			sg:SetCore("ResetButtonCallback", true)
			if destroyhum then
				c:BreakJoints()
				return
			end
			if antirespawn then
				if hum0 and hum0.Parent and (hum0.Health > 0) then
					model:BreakJoints()
					hum0.Health = 0
				end
				respawnrequest()
			else
				if hum0 and hum0.Parent and (hum0.Health > 0) then
					model:BreakJoints()
					hum0.Health = 0
				end
			end
		end)
		sg:SetCore("ResetButtonCallback", rb)

		spawn(function()
			while c do
				if hum0 and hum0.Parent and hum1 and hum1.Parent then
					hum1.Jump = hum0.Jump
				end
				wait()
			end
			sg:SetCore("ResetButtonCallback", true)
		end)

		R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
		if R15toR6 then
			local cfr = nil
			pcall(function()
				cfr = gp(c, "HumanoidRootPart", "BasePart").CFrame
			end)
			if cfr then
				local R6parts = { 
					head = {
						Name = "Head",
						Size = v3(2, 1, 1),
						R15 = {
							Head = 0
						}
					},
					torso = {
						Name = "Torso",
						Size = v3(2, 2, 1),
						R15 = {
							UpperTorso = 0.2,
							LowerTorso = -0.8
						}
					},
					root = {
						Name = "HumanoidRootPart",
						Size = v3(2, 2, 1),
						R15 = {
							HumanoidRootPart = 0
						}
					},
					leftArm = {
						Name = "Left Arm",
						Size = v3(1, 2, 1),
						R15 = {
							LeftHand = -0.85,
							LeftLowerArm = -0.2,
							LeftUpperArm = 0.4
						}
					},
					rightArm = {
						Name = "Right Arm",
						Size = v3(1, 2, 1),
						R15 = {
							RightHand = -0.85,
							RightLowerArm = -0.2,
							RightUpperArm = 0.4
						}
					},
					leftLeg = {
						Name = "Left Leg",
						Size = v3(1, 2, 1),
						R15 = {
							LeftFoot = -0.85,
							LeftLowerLeg = -0.15,
							LeftUpperLeg = 0.6
						}
					},
					rightLeg = {
						Name = "Right Leg",
						Size = v3(1, 2, 1),
						R15 = {
							RightFoot = -0.85,
							RightLowerLeg = -0.15,
							RightUpperLeg = 0.6
						}
					}
				}
				for i, v in pairs(c:GetChildren()) do
					if v:IsA("BasePart") then
						for i1, v1 in pairs(v:GetChildren()) do
							if v1:IsA("Motor6D") then
								v1.Part0 = nil
							end
						end
					end
				end
				for i, v in pairs(R6parts) do
					local part = Instance.new("Part")
					part.Name = v.Name
					part.Size = v.Size
					part.CFrame = cfr
					part.Anchored = false
					part.Transparency = 1
					part.CanCollide = false
					for i1, v1 in pairs(v.R15) do
						local R15part = gp(c, i1, "BasePart")
						local att = gp(R15part, "att1_" .. i1, "Attachment")
						if R15part then
							local weld = Instance.new("Weld", R15part)
							weld.Name = "Weld_" .. i1
							weld.Part0 = part
							weld.Part1 = R15part
							weld.C0 = cf(0, v1, 0)
							weld.C1 = cf(0, 0, 0)
							R15part.Massless = true
							R15part.Name = "R15_" .. i1
							R15part.Parent = part
							if att then
								att.Parent = part
								att.Position = v3(0, v1, 0)
							end
						end
					end
					part.Parent = c
					R6parts[i] = part
				end
				local R6joints = {
					neck = {
						Parent = R6parts.torso,
						Name = "Neck",
						Part0 = R6parts.torso,
						Part1 = R6parts.head,

					},
					rootJoint = {
						Parent = R6parts.root,
						Name = "RootJoint" ,
						Part0 = R6parts.root,
						Part1 = R6parts.torso,
						C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
						C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
					},
					rightShoulder = {
						Parent = R6parts.torso,
						Name = "Right Shoulder",
						Part0 = R6parts.torso,
						Part1 = R6parts.rightArm,

					},
					leftShoulder = {
						Parent = R6parts.torso,
						Name = "Left Shoulder",
						Part0 = R6parts.torso,
						Part1 = R6parts.leftArm,

					},
					rightHip = {
						Parent = R6parts.torso,
						Name = "Right Hip",
						Part0 = R6parts.torso,
						Part1 = R6parts.rightLeg,

					},
					leftHip = {
						Parent = R6parts.torso,
						Name = "Left Hip" ,
						Part0 = R6parts.torso,
						Part1 = R6parts.leftLeg,

					}
				}
				for i, v in pairs(R6joints) do
					local joint = Instance.new("Motor6D")
					for prop, val in pairs(v) do
						joint[prop] = val
					end
					R6joints[i] = joint
				end
				hum1.RigType = Enum.HumanoidRigType.R6
				hum1.HipHeight = 0
			end
		end
    end)



    tab2:NewButton("Reveal Chat",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    --This script reveals ALL hidden messages in the default chat
--chat "/e spy" to toggle!
enabled = true
--if true will check your messages too
spyOnMyself = true
--if true will chat the logs publicly (fun, risky)
public = false
--if true will use /me to stand out
publicItalics = false
--customize private logs
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
--////////////////////////////////////////////////////////////////
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,6)=="/e spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and p.Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
player:WaitForChild("PlayerGui"):WaitForChild("Chat")
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
wait(3)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
end)


tab4:NewButton("Unlock Forms",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    local plr = game.Players.LocalPlayer

		if plr.Backpack:FindFirstChild("Lightsaber") then
			plr.Backpack.Lightsaber.Assets.Animations.shien.Name = "Form6"
			plr.Backpack.Lightsaber.Assets.Animations.vaapad.Name = "Form7"
		else
			plr.Character.Lightsaber.Assets.Animations.shien.Name = "Form6"
			plr.Character.Lightsaber.Assets.Animations.vaapad.Name = "Form7"
		end

		plr.CharacterAdded:Connect(function()
			wait()
			plr.Backpack.Lightsaber.Assets.Animations.shien.Name = "Form6"
			plr.Backpack.Lightsaber.Assets.Animations.vaapad.Name = "Form7"
		end)
    end)



tab4:NewButton("Disco Saber",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    local ColorTable = {
        "red",
        "orange",
        "yellow",
        "purple",
        "pink",
        "green",
        "white",
        "cyan",
        "veridian",
        "blue",
        "darkBlue"
    };
    _G.Enabled = true

    while wait(0) and _G.Enabled do
        for i, v in pairs(ColorTable) do
            wait(0.1)
            local ohString1 = v;
            if game.Players.LocalPlayer.Character:FindFirstChild("Lightsaber") then
                game.Players.LocalPlayer.Character:FindFirstChild("Lightsaber").Assets.Events.colorSaber:FireServer(ohString1);
            end;
        end;
    end;
end)

tab4:NewButton("Holosaber",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    local plr = game:GetService("Players").LocalPlayer
    plr.Character.Handle.beamInner:Destroy()
    plr.Character.Handle.trailOuter:Destroy()
    plr.Character.Handle.trailInner:Destroy()
end)



tab4:NewButton("All Forms Spin",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()
    local number = 1

while wait() do
    if number == 1 then
        print("Running Code")
        local args = {
    [1] = 7
}

game:GetService("Players").LocalPlayer.Character.Lightsaber.Assets.Events.setForm:FireServer(unpack(args))
    end
end 
end)


tab5:NewButton("Autoparry (M)",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    game.StarterGui:SetCore("SendNotification", {Title = "Autoparry", Text = "Bind M"})
    local cooldown = {}
    local autoparry = false
    local UIS = game:GetService("UserInputService")

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
        if key == "m" then
            autoparry = not autoparry
            game.StarterGui:SetCore("SendNotification", {
                Title = "Autoparry toggled";
                Text = tostring(autoparry)
            })
        end
    end)
    local RunService = game:GetService("RunService")
    RunService.Heartbeat:Connect(function()
        if autoparry == false then return end
        local plr = game.Players.LocalPlayer
        local chr = plr.Character
        if not chr then return end
        if not chr:FindFirstChildOfClass("Tool") then return end
        local enemy = chr:FindFirstChildOfClass("Tool").combatData.Target.Value
        if not enemy then return end
        if not enemy:FindFirstChildOfClass("Tool").combatData.Attacking.Value then return end
        if cooldown[enemy] then return end
        cooldown[enemy] = true
        wait(0.2)
        chr:FindFirstChildOfClass("Tool").Assets.Events.attackStart:FireServer(enemy:FindFirstChildOfClass("Tool").combatData.Stance.Value,false)
        wait()
        chr:FindFirstChildOfClass("Tool").Assets.Events.cancelAttack:FireServer()
        wait(1)
        cooldown[enemy] = nil
    end)
end)

tab5:NewButton("Autoblock (U)",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    	--autoblock
	game.StarterGui:SetCore("SendNotification", {Title = "Autoblock", Text = "Bind U"})
    local cooldown = {}
    local Autoblock = false
    local UIS = game:GetService("UserInputService")

    UIS.InputBegan:Connect(function(input, x)
        if x then return end
        if input.KeyCode == Enum.KeyCode.U then
            Autoblock = not Autoblock
            game.StarterGui:SetCore("SendNotification", {
                Title = "Autoblock toggled";
                Text = tostring(Autoblock)
            })
        end
    end)

    local RunService = game:GetService("RunService")
    RunService.Heartbeat:Connect(function()
        if Autoblock == false then return end
        local plr = game:GetService("Players").LocalPlayer
        local chr = plr.Character
        if not chr:FindFirstChildOfClass("Tool") then return end
        local enemy = chr:FindFirstChildOfClass("Tool").combatData.Target.Value
        if not enemy then return end
        if not enemy:FindFirstChildOfClass("Tool") then return end
        local A_1 = enemy:FindFirstChildOfClass("Tool").combatData.Stance.Value
        local A_2 = false
        local Event = chr:FindFirstChildOfClass("Tool").Assets.Events.updateStance
        if not enemy:FindFirstChildOfClass("Tool").combatData.Attacking.Value then return end
        cooldown[enemy] = nil
        Event:FireServer(A_1, A_2)
        wait(0.005)
        Event:FireServer(A_1, A_2)
        wait(0.005)
        Event:FireServer(A_1, A_2)
    end)
end)


tab5:NewButton("360 bar",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()

    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
		getsenv(game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Client).getStance = function()

			local v71 = getsenv(game:GetService("Players").LocalPlayer.Character.Lightsaber.Client).stance;
			if not getsenv(game:GetService("Players").LocalPlayer.Character.Lightsaber.Client).isStanceLocked() then

				local v72 = Vector2.new(-1,0);
				local v73 = 2 * Vector2.new(mouse.X / mouse.ViewSizeX, 1 - mouse.Y / mouse.ViewSizeY) - Vector2.new(1, 1);
				local l__unit__74 = Vector2.new(v73.X, math.max(v73.Y, 0)).unit;
				local centVector = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2  - (game:GetService("GuiService"):GetGuiInset().Y/2))
				v71 = math.deg(math.atan2(mouse.y - centVector.y, mouse.x - centVector.X));
			end;
			local Marker = 180 * ((v71 + 160) / 120)

			return Marker 
		end
    end)


tab5:NewButton("Underhit (F)",function()
    local music3 = game:GetService("StarterGui").forcePowers.equip
    music3:play()
    local player = game.Players.LocalPlayer
		local plr = game:GetService("Players").LocalPlayer
		local mouse = player:GetMouse()
		local A_1 = -180    
		local A_2 = false
		local cdw = false
		local Event = plr.Character.Lightsaber.Assets.Events.attackStart

		bind = "f" 


		mouse.KeyDown:connect(function(key)
			if not Event then 
				return
			end
			if key == bind then
				Event:FireServer(A_1, A_2)
			end
		end)
    end)

    tab5:NewButton("Choke team",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip
        music3:play()
        local plr = game.Players.LocalPlayer
		local chr = plr.Character


		local env = getsenv(plr.Backpack.Force.Client)
		hookfunction(env.diffTeam, function()
			return true
		end)
    end)

    local function teleport(x,y,z)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
	end

    tab6:NewButton("The Mountain",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip
        music3:play()

        teleport(-848, 76, 423)
    end)

    
    tab6:NewButton("Sith Bridge",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip
        music3:play()
        teleport(488,184,-185)
    end)

    tab6:NewButton("Jedi Base",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip
        music3:play()       
        teleport(-434,58,-387)
    end)

    tab7:NewButton("Infinite Yield",function()
        local music3 = game:GetService("StarterGui").forcePowers.equip
        music3:play()  
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)


    

        
            


