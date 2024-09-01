local gun = script.Parent.Parent

local getMouseRemote = game.ReplicatedStorage.getMousePosition

gun.Activated:Connect(function()
	local player = game.Players:FindFirstChild(gun.Parent.Name)
	local rayOrigin = gun.Handle.rayOrigin.Position
	
	local mousePosition = getMouseRemote:InvokeClient(player)
	
	local directionToFire = (mousePosition - rayOrigin).Unit * 500
	
	local raycastResult = workspace:Raycast(rayOrigin, directionToFire)
	
	if raycastResult then
	   local highLight = Instance.new("Highlight")
	   highLight.Parent = raycastResult.Instance
	   local debris = game:GetService("Debris")
	   
	   debris:AddItem(raycastResult.Instance,2)
	 
	end
end)