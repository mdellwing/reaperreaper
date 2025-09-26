# reaperreaper
JSON/Reaper Marker-Utility


Setup:

Erzeuge ein Reaper-Projekt.
Lege deine Tracks an. Ein Track benötigt den Namen "Config"
Im Track "Config" muss ein "Empty-Item" hinzugefügt werden. In diesem Item muss das JSON als Inhalt kopiert werden, was die Marker-Beschriftung und colorierung triggert (Siehe example.json)
Das JSON kann mit Generator.html erzeugt werden oder nutze das example.json.

Lege für jeden gewünschten Marker eine Action mit dem Inhalt von Action.lua an. Die "Note"-Id muss jeweils unterschiedlich sein und wird zur Note im JSON referenziert.
Definiere deine eigenen Trigger für die Action mit Midi-Noten oder Tastatur-Shortcuts.

Happy reapering.


Da das JSON und damit die Marker-Beschriftung und Färbung je Reaper-Projekt d.h. je Song definiert werden kann kannst du einfach zwischen Songe hin und herspringen und hast pro Song immer die gewünschten Marker zu hand.