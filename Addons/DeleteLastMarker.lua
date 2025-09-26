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

-- ReaperAction: Letzten Marker mit höchster ID löschen

local retval, num_markers, num_regions = reaper.CountProjectMarkers(0)
if retval == 0 or num_markers == 0 then return end

local highest_id = -1

for i = 0, num_markers + num_regions - 1 do
  local retval, isrgn, pos, rgnend, name, markrgnindexnumber, color = 
    reaper.EnumProjectMarkers2(0, i)
  if retval and not isrgn then
    if markrgnindexnumber > highest_id then
      highest_id = markrgnindexnumber
    end
  end
end

if highest_id >= 0 then
  reaper.DeleteProjectMarker(0, highest_id, false)
end
