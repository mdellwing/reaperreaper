# reaperreaper
JSON/Reaper Marker-Utility


Setup:

Erzeuge ein Reaper-Projekt.
Lege deine Tracks an. Ein Track benötigt den Namen "Config"
Im Track "Config" muss ein "Empty-Item" hinzugefügt werden. In diesem Item muss das JSON als Inhalt kopiert werden, was die Marker-Beschriftung und colorierung triggert (Siehe example.json)
Das JSON kann mit Generator.html erzeugt werden oder nutze das example.json.

Lege für jeden gewünschten Marker eine Action mit dem Inhalt von Action.lua an. Die "Note"-Id muss jeweils unterschiedlich sein und wird zur Note im JSON referenziert.
Definiere deine eigenen Trigger für die Action mit Midi-Noten oder Tastatur-Shortcuts.

Da das JSON und damit die Marker-Beschriftung und Färbung je Reaper-Projekt d.h. je Song definiert werden kann kannst du einfach zwischen Songe hin und herspringen und hast pro Song immer die gewünschten Marker zu hand.

Happy reapering.


** MIT License **

Copyright (c) 2025 Michael Dellwing

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
-->
