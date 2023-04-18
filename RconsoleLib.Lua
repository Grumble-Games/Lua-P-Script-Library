function Load(Name, IncludeTime, PersistantTextColor, Description, InputTxt, UseCmds, Debug)
	if Name ~= nil then
		if IncludeTime == true then
			game:GetService("RunService").Heartbeat:Connect(function()
				local utc = 1
				local pst = 5
				local est = 8

				local date = os.date("!*t")
				local hour = (date.hour + utc) % 24
				local ampm = hour < 12 and "PM" or "AM"
				local utc = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)

				local date = os.date("!*t")
				local hour = (date.hour + pst) % 24
				local ampm = hour < 12 and "PM" or "AM"
				local pst = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)

				local date = os.date("!*t")
				local hour = (date.hour + est) % 24
				local ampm = hour < 12 and "PM" or "AM"
				local est = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)

				rconsolename(Name, " | UTC: " .. tostring(utc) .. ". PST: " .. tostring(pst) .. ". EST: " .. tostring(est) .. " |")
			end)
		else
			rconsolename(Name)
		end
	else
		rconsolename("Unnamed Rconsole | Made by John Lardier | NAME ME NAME ME NAME ME NAME ME NAME ME")
	end

	function Error(Text)
		rconsoleprint("[", "@@RED@@", "ERROR", PersistantTextColor,  "]: ", Text)
	end

	function InputInit()
		rconsoleprint(InputTxt)

		local Input = rconsoleinput()
		return Input
	end

	rconsoleprint(PersistantTextColor)

	rconsoleprint(Description)
	if Debug == true then
		print("Successfully loaded The gui")
	end

	if UseCmds == true then
		InputInit()
		if Debug == true then
			print("Loaded Command!")
		end
	end
end
