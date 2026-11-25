#import "../config.typ": writer_jan

= Self-Healing Mesh

== Was bedeutet Self-Healing? #writer_jan

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  #text(size: 20pt, weight: "bold")[
    Ein Thread-Netzwerk kann seine Kommunikationswege
    automatisch an Topologieänderungen anpassen.
  ]
]

#v(1em)

- Routerausfälle können erkannt werden
- Routinginformationen werden aktualisiert
- Alternative Wege können genutzt werden
- Keine manuelle Routenkonfiguration notwendig

#v(0.8em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Voraussetzung: Ein alternativer Funkpfad
  muss tatsächlich existieren.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Network Discovery and Formation
]


== Dynamisches Rerouting #writer_jan

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,

  [
    *Vor dem Ausfall*

    #box(
      width: 100%,
      fill: rgb("#e5eff4"),
      radius: 6pt,
      inset: 14pt,
    )[
      #align(center)[
        A → B → D

        #v(0.5em)

        Alternativ: A → C → D
      ]
    ]

    - Bevorzugter Pfad über B
    - Alternativer Weg vorhanden
  ],

  [
    *Nach dem Ausfall von B*

    #box(
      width: 100%,
      fill: rgb("#fce9d8"),
      radius: 6pt,
      inset: 14pt,
    )[
      #align(center)[
        A → C → D

        #v(0.5em)

        B nicht erreichbar
      ]
    ]

    - Routinginformationen ändern sich
    - Kommunikation über C möglich
  ],
)

#v(1em)

#text(size: 12pt, fill: gray)[
  Schematisches Beispiel; tatsächlicher Pfad
  hängt von Topologie und Pfadkosten ab.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Network Discovery and Formation
]


== Live-Demo: Routerausfall

#table(
  columns: (auto, 2.7fr),
  stroke: 0.8pt + rgb("#dddddd"),
  inset: 9pt,

  [*1*], [Thread-Mesh mit alternativen Wegen aufbauen],
  [*2*], [Routinginformationen dokumentieren],
  [*3*], [Kontinuierlichen Ping starten],
  [*4*], [Einen Router gezielt ausschalten],
  [*5*], [Routing und Erreichbarkeit erneut prüfen],
)

#v(0.8em)

*Zu untersuchende Messgrößen*

- Anzahl verlorener Ping-Pakete
- Dauer der Kommunikationsunterbrechung
- Änderungen des Next Hops und der Pfadkosten

#v(1fr)
#text(size: 9pt, fill: gray)[
  Eigener Versuchsaufbau;
  OpenThread – CLI Command Reference
]
