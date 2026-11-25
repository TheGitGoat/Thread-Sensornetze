#import "../config.typ": writer_lotte

= Einführung in Thread

== Was ist Thread? #writer_lotte

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 14pt,
)[
  #text(size: 22pt, weight: "bold")[
    Thread ist ein IPv6-basiertes Netzwerkprotokoll
    für energieeffiziente IoT-Geräte.
  ]
]

#v(1em)

- Funkkommunikation auf Basis von *IEEE 802.15.4*
- Selbstorganisierendes *Mesh-Netzwerk*
- Direkte Kommunikation über *IPv6*
- Unterstützt batteriebetriebene Geräte
- Unabhängig von der Anwendungsschicht, z. B. Matter

#v(0.5em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Ziel: Sichere, zuverlässige und energieeffiziente
  Kommunikation zwischen IoT-Geräten.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: @openthread-primer
]



== Warum brauchen wir Thread? #writer_lotte

#v(1fr)

- Niedriger Stromverbrauch (deutlich geringer als WLAN)
- Geringe Latenz und schnelle Reaktionszeiten
- Selbstheilendes Mesh-Netzwerk
- Einfache und hohe Skalierbarkeit
- Sichere Kommunikation durch AES-128-Verschlüsselung


#v(2fr)
#text(size: 9pt, fill: gray)[
  Quellen: @openthread-primer; @threadgroup-benefits
]


== Typische Einsatzgebiete #writer_lotte

#v(0.5fr)
- Smart Home
  - Beleuchtung, Thermostate, Tür- und Fenstersensoren
- Gebäudeautomatisierung
  - Raumklimasteuerung, Präsenzsensoren, Energiemanagement
- Sicherheit und Zugangskontrolle
  - Türkontakte, Alarmanlagen, Zutrittskontrollsysteme
- Sensorik und Monitoring
  - Temperaturmessung, Feuchtigkeit, Anlagenüberwachung

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: @threadgroup-overview
]

== Thread im Vergleich

#v(0.5fr)

#table(
  columns: (1.1fr, 1.4fr, 2fr),
  align: (left, left, left),
  inset: 8pt,

  table.header(
    [#strong[Standard]],
    [#strong[Einsatzgebiet]],
    [#strong[Eigenschaften]],
  ),

  [WLAN],
  [Smartphones, Kameras],
  [Hohe Datenrate, höherer Energiebedarf],

  [Bluetooth LE],
  [Wearables, Sensoren],
  [Geringer Energieverbrauch, kurze Reichweite],

  [Zigbee],
  [Smart Home],
  [Energieeffizientes Mesh-Netzwerk],

  [#strong[Thread]],
  [#strong[Smart Home, IoT]],
  [#strong[IPv6-basiertes, energieeffizientes Mesh-Netzwerk]],
)

#v(1fr)
