local INBOX = os.getenv("HOME") .. "/code/horcrux/inbox.md"

hs.hotkey.bind({"cmd", "alt"}, "c", function()
  hs.focus()
  local btn, text = hs.dialog.textPrompt("capture", "", "", "save", "cancel")
  if btn ~= "save" or text == "" then return end
  local stamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
  local f = io.open(INBOX, "a")
  f:write(string.format("\n## %s\n%s\n", stamp, text))
  f:close()
  hs.alert.show("captured")
end)
