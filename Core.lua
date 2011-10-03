
local function incoming(_, _, text)
	text = text:lower():trim()

	if text:find("^epgp standby") then return true end
end

local function outgoing(_, _, text)
	text = text:lower():trim()

	if
		text:find("is already in the award list$") or
		text:find("is now removed from the award list$") or
		text:find("is added to the award list$")
	then
		return true
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", incoming)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", outgoing)
