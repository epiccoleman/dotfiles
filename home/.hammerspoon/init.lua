local INBOX = os.getenv("HOME") .. "/capture/capture-inbox.md"
local captureWin = nil

local function saveEntry(text)
  if text and text ~= "" then
    local f = io.open(INBOX, "a")
    f:write(string.format("\n## %s\n%s\n", os.date("!%Y-%m-%dT%H:%M:%SZ"), text))
    f:close()
    hs.alert.show("captured")
  end
end

local html = [[
<!DOCTYPE html><html><head><style>
  html,body{margin:0;height:100%;background:#1e1e1e;}
  #t{box-sizing:border-box;width:100%;height:100%;border:0;outline:0;resize:none;
     background:#1e1e1e;color:#eee;font:16px/1.4 -apple-system,sans-serif;padding:14px;}
</style></head><body>
  <textarea id="t" placeholder="capture… (cmd+enter to save, esc to cancel)"></textarea>
  <script>
    const t = document.getElementById('t'); t.focus();
    document.addEventListener('keydown', e => {
      if (e.key === 'Enter' && e.metaKey)
        window.webkit.messageHandlers.cap.postMessage(t.value);
    });
  </script>
</body></html>
]]

hs.hotkey.bind({"cmd", "alt"}, "c", function()
  if captureWin then captureWin:delete(); captureWin = nil end
  local s = hs.screen.mainScreen():frame()
  local w, h = 600, 300
  local rect = hs.geometry.rect(s.x + (s.w-w)/2, s.y + (s.h-h)/3, w, h)

  local ucc = hs.webview.usercontent.new("cap")
  ucc:setCallback(function(msg)
    saveEntry(msg.body)
    if captureWin then captureWin:delete(); captureWin = nil end
  end)

  captureWin = hs.webview.new(rect, {}, ucc)
    :windowStyle({"titled", "closable", "resizable"})
    :allowTextEntry(true)
    :closeOnEscape(true)
    :level(hs.drawing.windowLevels.modalPanel)
    :html(html)
    :show()
  hs.timer.doAfter(0.1, function() captureWin:hswindow():focus() end)
end)
