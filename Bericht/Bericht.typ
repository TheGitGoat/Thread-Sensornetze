#set page(
  paper: "a4",
  number-align: center,
)
#set page(numbering: "1")

= Bericht Thread
#outline()
#pagebreak()

#include "Einleitung/Einleitung.typ"

#include "Technischer Hintergrund/Technischer Hintergrund.typ"

#include "Versuchsaufbau/Versuchsaufbau.typ"


Simulation mit OTNS
```
docker run -it -p 8997-9000:8997-9000 openthread/otns-playground
```