
= OpenThread

== Was ist OpenThread?

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 14pt,
)[
  #text(size: 21pt, weight: "bold")[
    OpenThread ist eine Open-Source-Implementierung
    des Thread-Netzwerkprotokolls.
  ]
]

#v(1em)

- Ursprünglich von Google veröffentlicht
- Implementiert zentrale Thread-Protokollfunktionen
- Plattformübergreifend auf verschiedenen Geräten nutzbar
- Programmierschnittstellen und Kommandozeilenwerkzeuge
- Grundlage für Entwicklung und Experimente

#v(0.8em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Thread = Protokollstandard

  OpenThread = Softwareimplementierung
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – openthread.io
]


== OpenThread: Software und Hardware

#align(center)[
  #block(width: 80%)[
    #table(
      columns: (1fr,),
      stroke: 1pt + white,
      inset: 12pt,

      table.cell(fill: rgb("#e5eff4"))[
        #align(center)[*Anwendung / Steuerungssoftware*]
      ],

      table.cell(fill: rgb("#fce9d8"))[
        #align(center)[*OpenThread-Protokollstack*]
      ],

      table.cell(fill: rgb("#fce9d8"))[
        #align(center)[*Platform Abstraction Layer (PAL)*]
      ],

      table.cell(fill: rgb("#23373b"))[
        #align(center)[
          #text(fill: white)[
            *Hardware / IEEE 802.15.4-Funkchip*
          ]
        ]
      ],
    )
  ]
]

#v(1em)

- OpenThread kann direkt auf einem Mikrocontroller laufen
- Alternativ: Host-Prozessor mit separatem Funk-Coprozessor
- OpenThread Border Router (OTBR) verbindet IP-Netze

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: OpenThread – Platforms;
  OpenThread – Border Router
]
