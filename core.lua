Fujin = LibStub("AceAddon-3.0"):NewAddon("FujinHealthBarText", "AceHook-3.0")

function Fujin:OnInitialize()
	--some of this is definitely redundant, but it's late and I'm tired...
	self:SecureHook("UnitFrameHealthBar_Update")
	self:SecureHook("UnitFrameHealthBar_OnUpdate")
	self:SecureHook("UnitFrameHealthBar_Initialize")
	self:SecureHook("UnitFrameHealthBar_OnEvent")
end

function Fujin:UnitFrameHealthBar_Update(statusbar, unit)
	self:SetCurrentHealthText(statusbar, unit)
end

function Fujin:UnitFrameHealthBar_OnUpdate(frame)
	self:SetCurrentHealthText(frame, frame.unit)
end

function Fujin:UnitFrameHealthBar_Initialize(unit, statusbar)
	self:SetCurrentHealthText(statusbar, unit)
end

function Fujin:UnitFrameHealthBar_OnEvent(frame, event, ...)
	self:SetCurrentHealthText(frame, ...)
end

function Fujin:SetCurrentHealthText(statusbar, unit)
	if not statusbar or not statusbar.TextString or statusbar.lockValues then
		return
	end

	if not statusbar:IsForbidden() and unit == statusbar.unit and unit == "player" then
		local health = UnitHealth(unit)
		statusbar.TextString:SetText(health)
	end
end