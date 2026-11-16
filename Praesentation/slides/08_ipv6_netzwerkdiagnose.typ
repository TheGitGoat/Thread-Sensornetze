
= IPv6-Kommunikation

== IPv6-Adressen in Thread

#table(
  columns: (1.4fr, 2.4fr),
  stroke: 0.8pt + rgb("#dddddd"),
  inset: 10pt,

  table.header(
    [*Adresstyp*],
    [*Verwendung*],
  ),

  [Link-Local],
  [Kommunikation auf einem einzelnen Link],

  [Mesh-Local EID],
  [Stabile Adressierung innerhalb des Thread-Mesh],

  [RLOC],
  [Topologieabhängige Lokalisierung und Weiterleitung],

  [Weitere Präfix-Adressen],
  [Kommunikation über Netzgrenzen, je nach Konfiguration],
)

#v(1em)

- IPv6 ist Bestandteil der Thread-Netzwerkschicht
- Geräte können mehrere IPv6-Adressen besitzen
- Border Router ermöglichen externe IPv6-Konnektivität

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – IPv6 Addressing
]


== Ping und Traceroute

#grid(
  columns: (1fr, 1fr),
  gutter: 18pt,

  [
    *Ping (ICMPv6)*

    - Erreichbarkeit testen
    - Round-Trip-Time messen
    - Paketverluste erkennen

    ```sh
    ping <IPv6-Adresse>
    ```
  ],

  [
    *Traceroute*

    - IP-Routinghops untersuchen
    - Pfadänderungen analysieren
    - Unterstützung prüfen

    ```sh
    traceroute -6 <IPv6-Adresse>
    ```
  ],
)

#v(1em)

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *Achtung:*

  Traceroute zeigt IP-Hops, aber nicht zwingend
  jeden einzelnen Funkhop im Thread-Mesh.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quellen: OpenThread – CLI Reference;
  RFC 4443 (ICMPv6)
]
