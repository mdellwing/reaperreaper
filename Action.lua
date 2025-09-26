--[[
MIT License

Copyright (c) 2025 Michael Dellwing - www.vantadesign.de

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]


-- Einfache Marker-Action mit expliziter Note-ID aus JSON
local NOTE_ID   = 24        -- <- HIER die gewünschte MIDI-Note angeben
local TRACK_NAME = "Config" -- Spur mit Config-Item

-- json.lua laden
package.path = reaper.GetResourcePath() .. "/Scripts/?.lua;" .. package.path
local ok_json, json = pcall(require, "json")
if not ok_json then
  reaper.ShowMessageBox("json.lua nicht gefunden.", "Fehler", 0)
  return
end

local function find_track_by_name(name)
  for i=0, reaper.CountTracks(0)-1 do
    local tr = reaper.GetTrack(0,i)
    local ok, nm = reaper.GetSetMediaTrackInfo_String(tr, "P_NAME", "", false)
    if ok and nm == name then return tr end
  end
end

local function first_item_on_track(tr)
  if not tr then return nil end
  return reaper.GetTrackMediaItem(tr, 0)
end

local function parse_color(s)
  if not s or s == "" then return 0 end
  local r,g,b
  if s:sub(1,1) == "#" and #s == 7 then
    r = tonumber(s:sub(2,3),16)
    g = tonumber(s:sub(4,5),16)
    b = tonumber(s:sub(6,7),16)
  else
    r,g,b = s:match("^(%d+)%s*,%s*(%d+)%s*,%s*(%d+)$")
    r = tonumber(r); g = tonumber(g); b = tonumber(b)
  end
  if r and g and b then
    local native = reaper.ColorToNative(r,g,b)
    return native | 0x1000000
  end
  return 0
end

local function add_marker(pos, name, color)
  name  = tostring(name or "")
  color = tonumber(color or 0) or 0
  local ok = pcall(function()
    reaper.AddProjectMarker2(0, false, pos, 0, name, -1, color)
  end)
  if not ok then
    reaper.AddProjectMarker2(0, false, pos, 0, name, -1)
  end
end

-- Config laden
local tr = find_track_by_name(TRACK_NAME)
local it = first_item_on_track(tr)
if not it then return end

local ok, notes = reaper.GetSetMediaItemInfo_String(it, "P_NOTES", "", false)
if not ok or notes == "" then return end

local cfg = json.decode(notes)
if type(cfg) ~= "table" then return end

-- Passenden Eintrag mit NOTE_ID suchen
local entry = nil
for _, e in ipairs(cfg) do
  if e.note == NOTE_ID then
    entry = e
    break
  end
end

if not entry then
  reaper.ShowMessageBox("Kein Mapping für Note "..tostring(NOTE_ID), "Hinweis", 0)
  return
end

-- Marker setzen
local playstate = reaper.GetPlayState()         -- Bit 1 == playing
local pos = (playstate & 1 == 1) and reaper.GetPlayPosition() or reaper.GetCursorPosition()
local label = entry.label or ("Note "..NOTE_ID)
local color = parse_color(entry.color)
add_marker(pos, label, color)
