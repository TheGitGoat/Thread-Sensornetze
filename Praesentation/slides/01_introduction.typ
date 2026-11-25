#import "@preview/metropolyst:0.1.0": *

= Einführung in Thread

== Was ist Thread?

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 14pt,
)[
  #text(size: 22pt, weight: "bold")[
    Thread ist ein IPv6-basiertes Funknetzwerkprotokoll
    für energieeffiziente IoT-Geräte.
  ]
]

#v(1em)

- Drahtlose Kommunikation über *IEEE 802.15.4*
- Selbstorganisierendes *Mesh-Netzwerk*
- Direkte Kommunikation auf Basis von *IPv6*
- Entwickelt für Geräte mit geringem Energiebedarf
- Netzwerkprotokoll, unabhängig von der Anwendung

#v(0.5em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Ziel: Sichere, zuverlässige und energieeffiziente
  Vernetzung von IoT-Geräten.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Thread Primer (Was ist Thread?)
]




== Warum brauchen wir Thread?

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,

  [
    *Herausforderungen im IoT*

    - Viele verteilte Sensoren und Aktoren
    - Batteriebetriebene Geräte
    - Begrenzte Funkreichweite
    - Zuverlässige Kommunikation erforderlich
    - Unterschiedliche Hersteller und Systeme
  ],

  [
    *Lösungsansätze von Thread*

    - Energiesparende Endgeräte
    - Mehrere Funkhops durch Mesh-Routing
    - Automatische Netzwerkanpassung
    - Verschlüsselte Kommunikation
    - IPv6 als gemeinsame Grundlage
  ],
)



#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: OpenThread – Thread Primer;
  Thread Group – Thread Benefits
]


== Typische Einsatzgebiete

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,

  block(
    fill: rgb("#e5eff4"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Smart Home*

    - Beleuchtung
    - Thermostate
    - Tür- und Fenstersensoren
  ],

  block(
    fill: rgb("#e5eff4"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Gebäudeautomatisierung*

    - Raumklimasteuerung
    - Präsenzsensoren
    - Energiemanagement
  ],

  block(
    fill: rgb("#e5eff4"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Sensornetzwerke*

    - Temperaturmessung
    - Luftfeuchtigkeit
    - Zustandsüberwachung
  ],

  block(
    fill: rgb("#e5eff4"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Vernetzte Aktoren*

    - Schalter
    - Ventile
    - Steuerungssysteme
  ],
)

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: Thread Group – Overview / Market Segments
]
