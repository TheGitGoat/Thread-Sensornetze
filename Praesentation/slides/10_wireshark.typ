#import "../config.typ": writer_anthony

= Netzwerkanalyse mit Wireshark

== Warum Wireshark? #writer_anthony

- Netzwerkverkehr auf Paketebene untersuchen
- Protokollinformationen sichtbar machen
- Kommunikationsabläufe nachvollziehen
- Fehler und Paketverluste analysieren

#v(1em)

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *Typische Fragestellungen*

  - Welche Geräte kommunizieren miteinander?
  - Welche Protokolle werden verwendet?
  - Was passiert beim Verbindungsaufbau?
  - Wie verändert sich der Verkehr bei einem Ausfall?
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: Wireshark – User's Guide;
  OpenThread – Packet Sniffing
]


== Over-the-Air Packet Sniffing #writer_anthony

#v(5em)

#align(center)[
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    gutter: 8pt,
    align: center,

    box(
      fill: rgb("#e5eff4"),
      radius: 6pt,
      inset: 10pt,
    )[
      #align(center)[
        *Thread-Geräte*

        #text(size: 11pt)[Funkverkehr]
      ]
    ],

    text(size: 18pt)[→],

    box(
      fill: rgb("#fce9d8"),
      radius: 6pt,
      inset: 10pt,
    )[
      #align(center)[
        *802.15.4-Sniffer*

        #text(size: 11pt)[Mitschnitt]
      ]
    ],

    text(size: 18pt)[→],

    box(
      fill: rgb("#e5eff4"),
      radius: 6pt,
      inset: 10pt,
    )[
      #align(center)[
        *Wireshark*

        #text(size: 11pt)[Analyse]
      ]
    ],
  )
]

#v(1em)

- IEEE 802.15.4 Kanal
- IEEE 802.15.4 Schlüssel

#v(0.6em)

// #text(fill: rgb("#eb811b"), weight: "bold")[
//   OTA-Sniffing erfasst Funkframes,
//   nicht die analoge Funkwelle.
// ]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: OpenThread – Packet Sniffing;
  Wireshark – IEEE 802.15.4
]


== Vorbereitung der Sniffer Hardware #writer_anthony
- Ebyte E104-BT5040UA Bluetooth-Stick
- Flashen der Nordic nRF802154 Firmware
- Wireshark Interface
#figure(
  image("../pictures/2022161134211859.jpg", width: 35%),
  caption: [
    E104-BT5040UA @cdebyte2022image
  ],
)

== Paketmitschnitt

Ping
TODO: Bild

Fragmentierung
TODO: Bild

== Was sehen wir im Paketmitschnitt? #writer_anthony

#v(3em)

#table(
  columns: (1.2fr, 2.2fr),
  stroke: 0.8pt + rgb("#dddddd"),
  inset: 9pt,

  table.header(
    [*Protokoll*],
    [*Beobachtbare Informationen*],
  ),

  [IEEE 802.15.4],
  [MAC-Adressen, Frame-Typ, Sequenznummer],

  [6LoWPAN],
  [Komprimierung und Fragmentierung],

  [IPv6],
  [Quell- und Zieladressen],

  [ICMPv6],
  [Echo Request und Echo Reply],

  [MLE],
  [Nachbarschafts- und Kontrollnachrichten],
)

#v(0.8em)

// #block(
//   fill: rgb("#f5f7f7"),
//   radius: 6pt,
//   inset: 10pt,
// )[
//   *Live-Demo:*

//   Ping auslösen und die zugehörigen Pakete
//   im Mitschnitt identifizieren.
// ]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: Wireshark – Display Filter Reference;
  OpenThread – Thread Primer
]

== Open Thread Network Simulator (OTNS) #writer_anthony

- 1x Border Router
- 2x Full Thread Device
- 2x Sleepy End Device