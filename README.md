# reaperreaper
JSON/Reaper Marker-Utility

---

## Setup

### Installation von `json.lua` in Reaper

1. Lade die Datei [`json.lua`](https://github.com/rxi/json.lua) herunter.
2. Öffne in Reaper **Options → Show REAPER resource path in explorer/finder**.
3. Wechsle in den Ordner **Scripts**.
4. Kopiere die Datei `json.lua` in diesen Ordner.

---

## Nutzung

1. Erzeuge ein neues Reaper-Projekt.
2. Lege deine Tracks an.  
   - Ein Track benötigt den Namen **`Config`**.
3. Füge im Track **`Config`** ein *Empty Item* hinzu.  
   - In diesem Item muss das JSON als Inhalt eingefügt werden, das die Marker-Beschriftung und Colorierung triggert (siehe `example.json`).
   - Das JSON kannst du mit `Generator.html` erzeugen oder direkt das `example.json` verwenden.
4. Lege für jeden gewünschten Marker eine Action mit dem Inhalt aus `Action.lua` an.  
   - Die `Note`-ID muss jeweils unterschiedlich sein und referenziert auf die entsprechende Note im JSON.
5. Definiere deine eigenen Trigger für die Action mit MIDI-Noten oder Tastatur-Shortcuts.

✨ Vorteil:  
Da das JSON – und damit Marker-Beschriftung und Färbung – je Reaper-Projekt (d. h. je Song) definiert werden kann, kannst du einfach zwischen Songs hin- und herspringen und hast pro Song immer die gewünschten Marker zur Hand.

---

## Lizenz

**MIT License**

Copyright (c) 2025 Michael Dellwing www.vantadesign.de


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

