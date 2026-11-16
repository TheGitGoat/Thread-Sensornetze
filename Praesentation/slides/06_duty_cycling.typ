
= Radio Duty Cycling

== Warum ist Duty Cycling wichtig?

#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,

  [
    *Dauerhaft aktiver Funkempfänger*

    - Hohe Empfangsbereitschaft
    - Geringe Reaktionszeit
    - Höherer Energieverbrauch
  ],

  [
    *Zeitweise deaktivierter Empfänger*

    - Niedriger Energieverbrauch
    - Batteriebetrieb möglich
    - Verzögerte Zustellung möglich
  ],
)

#v(1em)

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *Radio Duty Cycling:*

  Der Funkempfänger wird zeitweise deaktiviert,
  um den durchschnittlichen Energieverbrauch
  zu reduzieren.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Node Roles and Types
]


== Sleepy End Devices (SED)

#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    stroke: 1pt + white,
    inset: 10pt,

    table.cell(fill: rgb("#eb811b"))[
      #align(center)[*Aktiv*]
    ],
    table.cell(fill: rgb("#e5eff4"))[
      #align(center)[Schlaf]
    ],
    table.cell(fill: rgb("#e5eff4"))[
      #align(center)[Schlaf]
    ],
    table.cell(fill: rgb("#eb811b"))[
      #align(center)[*Aktiv*]
    ],
    table.cell(fill: rgb("#e5eff4"))[
      #align(center)[Schlaf]
    ],
  )
]

#v(1em)

- SED deaktiviert den Empfänger zwischen Aktivitäten
- Parent-Router hält eingehende Nachrichten vor
- SED fragt ausstehende Daten regelmäßig ab
- Polling-Intervall beeinflusst Energie und Latenz

#v(0.8em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Kürzeres Polling-Intervall:
  schnellere Zustellung, aber mehr Funkaktivität.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Node Roles and Types
]
