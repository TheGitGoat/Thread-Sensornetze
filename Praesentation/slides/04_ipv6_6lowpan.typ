//Fachlicher Hinweis: Die 2 Byte beziehen sich auf den minimalen komprimierten IPv6-Header im günstigen Fall, nicht auf den gesamten Funkframe. Zusätzliche Adressinformationen, Transport-Header und andere Felder können weiterhin Platz benötigen.
= 6LoWPAN

== Warum wird 6LoWPAN benötigt?

#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,

  [
    *IPv6*

    - IPv6-Header: 40 Byte
    - IPv6-Pakete können sehr groß sein
    - Für klassische IP-Netzwerke entwickelt
  ],

  [
    *IEEE 802.15.4*

    - Maximale Framegröße: 127 Byte
    - Zusätzlicher MAC-Overhead
    - Begrenzte Bandbreite und Energie
  ],
)

#v(1em)

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *Das Problem:*

  IPv6 muss effizient über Funkverbindungen mit
  sehr kleinen Frames übertragen werden.
]

#v(0.5em)

#align(center)[
  #text(
    size: 20pt,
    weight: "bold",
    fill: rgb("#eb811b"),
  )[6LoWPAN als Anpassungsschicht]
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: RFC 4944; RFC 6282
]


== Die Aufgaben von 6LoWPAN

#grid(
  columns: (1fr, 1fr),
  gutter: 14pt,

  block(
    fill: rgb("#f5f7f7"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Header Compression*

    IPv6-Header durch Weglassen
    ableitbarer Informationen verkleinern.
  ],

  block(
    fill: rgb("#f5f7f7"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Fragmentierung*

    Große IPv6-Pakete auf mehrere
    IEEE-802.15.4-Frames verteilen.
  ],

  block(
    fill: rgb("#f5f7f7"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Reassemblierung*

    Fragmente beim Empfänger wieder
    zum ursprünglichen Paket zusammensetzen.
  ],

  block(
    fill: rgb("#f5f7f7"),
    radius: 6pt,
    inset: 12pt,
  )[
    *Mesh-Weiterleitung*

    Unterstützung der Weiterleitung
    über mehrere Funkhops.
  ],
)

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: RFC 4944; RFC 6282
]



== Beispiel: IPv6 Header Compression

#align(center)[
  *Unkomprimierter IPv6-Header*

  #v(0.3em)

  #box(
    width: 85%,
    fill: rgb("#23373b"),
    radius: 5pt,
    inset: 8pt,
  )[
    #align(center)[
      #text(fill: white, weight: "bold")[40 Byte]
    ]
  ]

  #v(0.4em)

  #text(size: 18pt, fill: rgb("#eb811b"))[↓]

  #v(0.4em)

  *6LoWPAN Header Compression (IPHC)*

  #v(0.3em)

  #box(
    width: 35%,
    fill: rgb("#eb811b"),
    radius: 5pt,
    inset: 8pt,
  )[
    #align(center)[
      #text(fill: white, weight: "bold")[
        Im Idealfall 2 Byte
      ]
    ]
  ]
]

#v(0.5em)

- Ableitbare Adressinformationen entfallen
- Gemeinsamer Netzwerkkontext wird genutzt
- Tatsächliche Größe hängt vom Paket ab

#v(0.3em)

#text(size: 9pt, fill: gray)[
  Quelle: RFC 6282
]

