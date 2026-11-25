#set text(hyphenate: true)

= Thread-Architektur

== Der Thread-Protokollstack

#align(center)[
  #table(
    columns: (2.1fr, 3.4fr),
    stroke: 0.8pt + rgb("#dddddd"),
    inset: 9pt,

    table.header(
      [*Schicht*],
      [*Funktion*],
    ),

    table.cell(fill: rgb("#e5eff4"))[
      *Anwendung*
    ],
    [Matter, CoAP oder eigene Anwendungen],

    table.cell(fill: rgb("#fce9d8"))[
      *UDP / Transport*
    ],
    [Datenaustausch zwischen Endpunkten],

    table.cell(fill: rgb("#fce9d8"))[
      *IPv6 / Routing*
    ],
    [Adressierung und Paketweiterleitung],

    table.cell(fill: rgb("#fce9d8"))[
      *6LoWPAN*
    ],
    [Anpassung von IPv6 an kleine Funkframes],

    table.cell(fill: rgb("#eeeeee"))[
      *IEEE 802.15.4 MAC*
    ],
    [Medienzugriff und MAC-Sicherheit],

    table.cell(fill: rgb("#eeeeee"))[
      *IEEE 802.15.4 PHY*
    ],
    [Physikalische Funkübertragung],
  )
]

#v(0.5em)

#align(center)[
  #text(size: 12pt, fill: rgb("#eb811b"))[
    Thread verbindet standardisierte IP-Kommunikation
    mit energieeffizienter Funktechnik.
  ]
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: Thread Group – Technical Overview;
  OpenThread – Thread Primer
]

== Rollen für Paketweiterleitung

#let color-left = rgb("#2d579c")
#let color-right = rgb("#00afd8")

// Einstellungen
#let layout-height = 360pt
#let image-width = 350pt

#block(
  width: 100%,
  height: layout-height,
)[
  // Bild im Hintergrund, exakt mittig
  #place(
    right + horizon,
  )[
    #image(
      "../images/03_Paketweiterleitung.png",
      width: image-width,
    )
  ]

  // Textspalten im Vordergrund
  #grid(
    columns: (1fr, 1.2fr),
    rows: (1fr, 1fr),
    gutter: 16pt,

    // Links
    [
      #block(
        width: 100%,
        fill: color-left,
        radius: 5pt,
        inset: 10pt,
      )[
        #align(center)[
          #text(fill: white, weight: "bold")[
            Mesh Extender
          ]
        ]
      ]

      #v(0.8em)

      - Leitet Pakete weiter
      - Erweitert das Mesh-Netzwerk
      - Funkempfänger dauerhaft aktiv
    ],

    // Mitte bleibt leer
    [],

    // Rechts
    [
      #block(
        width: 100%,
        fill: color-right,
        radius: 5pt,
        inset: 10pt,
      )[
        #align(center)[
          #text(fill: white, weight: "bold")[
            End Device
          ]
        ]
      ]

      #v(0.8em)

      - Kommuniziert über einen Parent
      - Leitet keine fremden Pakete weiter
      - Kann als Sleepy End Device arbeiten
    ],
  )
]


== Gerätetypen

#let color-left = rgb("#ffffff")
#let color-right = rgb("#ffffff")

#let layout-height = 360pt
#let image-width = 325pt

#block(
  width: 100%,
  height: layout-height,
)[
  // Bild im Hintergrund, exakt mittig
  #place(
    right + horizon,
  )[
    #image(
      "../images/03_Gerätetypen.png",
      width: image-width,
    )
  ]

  // Textspalten im Vordergrund
  #grid(
    columns: (1fr, 1.2fr),
    rows: (1fr, 1fr),
    gutter: 16pt,

    // Links
    [
      #block(
        width: 100%,
        fill: color-left,
        radius: 1pt,
        inset: 10pt,
        stroke: 3pt + black,
      )[
        #align(center)[
          #text(fill: black, weight: "bold")[
            Full Thread Device
          ]
        ]
      ]

      #v(0.8em)

      - Leitet Pakete weiter
      - Erweitert das Mesh-Netzwerk
      - Funkempfänger dauerhaft aktiv
    ],

    // Mitte bleibt leer
    [],

    // Rechts
    [
      #block(
        width: 100%,
        fill: color-right,
        radius: 1pt,
        inset: 10pt,
        stroke: 3pt + black,
      )[
        #align(center)[
          #text(fill: black, weight: "bold")[
            Minimal Thread Device
          ]
        ]
      ]

      #v(0.8em)

      - Kommuniziert über einen Parent
      - Leitet keine fremden Pakete weiter
      - Kann als Sleepy End Device arbeiten
    ],
  )
]




== Mesh-Netzwerk und Netzwerkrollen

#grid(
  columns: (1.2fr, 1fr),
  gutter: 18pt,

  [
    #align(center)[
      #text(weight: "bold")[Vereinfachte Topologie]

      #v(0.7em)

      #box(
        fill: rgb("#23373b"),
        radius: 6pt,
        inset: 12pt,
      )[
        #text(fill: white)[Leader]
      ]

      #v(0.4em)
      #text(fill: gray)[Funkverbindungen]
      #v(0.4em)

      #grid(
        columns: (1fr, 1fr),
        gutter: 10pt,

        box(
          fill: rgb("#fce9d8"),
          radius: 6pt,
          inset: 10pt,
        )[
          #align(center)[Router A]
        ],

        box(
          fill: rgb("#fce9d8"),
          radius: 6pt,
          inset: 10pt,
        )[
          #align(center)[Router B]
        ],
      )

      #v(0.7em)

      #grid(
        columns: (1fr, 1fr),
        gutter: 10pt,

        box(
          fill: rgb("#e5eff4"),
          radius: 6pt,
          inset: 10pt,
        )[
          #align(center)[End Device]
        ],

        box(
          fill: rgb("#e5eff4"),
          radius: 6pt,
          inset: 10pt,
        )[
          #align(center)[Sleepy ED]
        ],
      )
    ]
  ],

  [
    *Leader*

    - Verwaltet Routerinformationen
    - Genau einer pro Partition

    *Router*

    - Leitet Pakete weiter
    - Verbindet Netzwerkteilnehmer

    *End Device*

    - Kommuniziert über einen Parent
    - Leitet keine fremden Pakete weiter
  ],
)

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Node Roles and Types
]


== Gerätetypen in Thread

#table(
  columns: (1.2fr, 2fr, 2fr),
  stroke: 0.8pt + rgb("#dddddd"),
  inset: 10pt,

  table.header(
    [*Eigenschaft*],
    [*Full Thread Device (FTD)*],
    [*Minimal Thread Device (MTD)*],
  ),

  [Rollen],
  [Router oder End Device],
  [Nur End Device],

  [Paketweiterleitung],
  [Als Router möglich],
  [Keine Weiterleitung für andere Geräte],

  [Funkbetrieb],
  [Ständig empfangsbereit],
  [Je nach Typ auch Schlafmodus],

  [Beispiele],
  [Router, Full End Device],
  [MED, Sleepy End Device],
)

#v(1em)

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *Wichtige Unterscheidung:*

  Ein FTD ist nicht automatisch ein Router.
  Ein MTD kann dagegen niemals die Routerrolle übernehmen.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Node Roles and Types
]


== Border Router: Verbindung zu anderen IP-Netzen

#align(center)[
  #grid(
    columns: (1fr, auto, 1.2fr, auto, 1fr),
    gutter: 8pt,
    align: center,

    box(
      fill: rgb("#e5eff4"),
      radius: 6pt,
      inset: 12pt,
    )[
      #align(center)[
        *Thread-Mesh*

        #text(size: 12pt)[
          Sensoren und Aktoren
        ]
      ]
    ],

    text(size: 22pt)[↔],

    box(
      fill: rgb("#fce9d8"),
      radius: 6pt,
      inset: 12pt,
    )[
      #align(center)[
        *Border Router*

        #text(size: 12pt)[
          IPv6-Weiterleitung
        ]
      ]
    ],

    text(size: 22pt)[↔],

    box(
      fill: rgb("#e5eff4"),
      radius: 6pt,
      inset: 12pt,
    )[
      #align(center)[
        *LAN / WLAN*

        #text(size: 12pt)[
          Weitere IP-Geräte
        ]
      ]
    ],
  )
]

#v(1.2em)

- Verbindet Thread mit anderen IP-Netzwerken
- Ermöglicht IPv6-Kommunikation über Netzgrenzen
- Stellt notwendige Netzwerkinformationen bereit
- Mehrere Border Router pro Thread-Netzwerk möglich

#v(0.6em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Thread benötigt keinen Border Router für
  die interne Kommunikation im Mesh.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: OpenThread – Node Roles and Types;
  Thread Group – Technical Overview
]
