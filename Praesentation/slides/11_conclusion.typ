
= Fazit

== Stärken und Grenzen von Thread

#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,

  [
    *Stärken*

    - IPv6-basierte Kommunikation
    - Energieeffiziente Endgeräte
    - Selbstorganisierendes Mesh
    - Standardisierte Funktechnik
    - Dynamische Anpassung
  ],

  [
    *Grenzen*

    - Geringe Datenrate
    - Begrenzte Funkreichweite pro Hop
    - Latenz bei schlafenden Geräten
    - Abhängigkeit von der Topologie
    - Zusätzlicher Aufwand für externe Anbindung
  ],
)

#v(1em)

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *Einordnung:*

  Thread eignet sich besonders für kleine,
  energieeffiziente Datenübertragungen in
  vernetzten IoT-Systemen.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: OpenThread – Thread Primer;
  Thread Group – Technical Overview
]


== Zusammenfassung und Diskussion

#align(center)[
  #text(size: 26pt, weight: "bold")[
    Thread verbindet IPv6 mit
    energieeffizienter Mesh-Kommunikation.
  ]

  #v(1.5em)

  #text(size: 18pt, fill: rgb("#eb811b"))[
    Architektur · Routing · Energieeffizienz
  ]

  #v(1em)

  #text(size: 18pt)[
    OpenThread · Wireshark · Self-Healing
  ]

  #v(2em)

  #text(size: 24pt, weight: "bold")[
    Vielen Dank!
  ]

  #v(0.5em)

  Fragen und Diskussion
]
