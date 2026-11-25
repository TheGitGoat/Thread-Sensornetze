#import "../config.typ": writer_jan

= Routing in Thread

== Wie funktioniert Thread-Routing? #writer_jan

- Router bilden das weiterleitende Mesh-Netzwerk
- Kommunikation über einen oder mehrere Funkhops
- Router tauschen Informationen über erreichbare Router aus
- Pfadkosten beeinflussen die Wahl des nächsten Hops
- Routing reagiert auf Änderungen der Netzwerktopologie

#v(0.8em)

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *Grundprinzip: Distance-Vector-Routing*

  Jeder Router verwaltet Informationen darüber,
  über welchen nächsten Router ein Ziel
  mit welchen Pfadkosten erreichbar ist.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Network Discovery and Formation
]


== Mesh Link Establishment (MLE) #writer_jan

#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,

  [
    *Verbindungsverwaltung*

    - Nachbarn entdecken
    - Verbindungsqualität bewerten
    - Parent-Child-Beziehungen aufbauen
    - Verbindungsparameter aushandeln
  ],

  [
    *Netzwerkinformationen*

    - Routerinformationen verbreiten
    - Netzwerkdaten austauschen
    - Topologieänderungen erkennen
    - Routinginformationen aktualisieren
  ],
)

#v(1em)

#block(
  fill: rgb("#fce9d8"),
  radius: 6pt,
  inset: 12pt,
)[
  *Wichtig:*

  MLE unterstützt die Organisation des Mesh-Netzes
  und die Verbreitung von Routinginformationen.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – Network Discovery and Formation
]


== Vergleich: Thread-Routing und RPL #writer_jan

#table(
  columns: (1.1fr, 1.4fr, 1.4fr),
  stroke: 0.8pt + rgb("#dddddd"),
  inset: 8pt,

  table.header(
    [*Eigenschaft*],
    [*Thread*],
    [*RPL*],
  ),

  [Routingprinzip],
  [Distance Vector zwischen Routern],
  [DODAG-basierte Routingstruktur],

  [Topologie],
  [Router-Mesh mit Endgeräten],
  [Gerichteter Graph mit Root],

  [Pfadbewertung],
  [Link Quality und Pfadkosten],
  [Konfigurierbare Objective Functions],

  [Einsatz],
  [Thread-Netzwerke],
  [Low-Power and Lossy Networks],
)

#v(0.8em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Thread verwendet kein RPL als internes Routingprotokoll.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: OpenThread – Network Discovery;
  RFC 6550 (RPL)
]
