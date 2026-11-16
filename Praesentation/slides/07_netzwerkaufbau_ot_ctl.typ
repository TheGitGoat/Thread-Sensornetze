
= Netzwerkmanagement mit ot-ctl

== OpenThread CLI und ot-ctl

#block(
  fill: rgb("#f5f7f7"),
  radius: 6pt,
  inset: 12pt,
)[
  *ot-ctl*

  Kommandozeilenwerkzeug zur Steuerung einer
  OpenThread-Instanz, beispielsweise auf einem
  Linux-basierten OpenThread Border Router.
]

#v(1em)

- Netzwerkparameter konfigurieren
- Gerätestatus und IPv6-Adressen anzeigen
- Nachbarn und Routinginformationen untersuchen
- Diagnosebefehle und Tests ausführen

#v(0.8em)

#text(fill: rgb("#eb811b"), weight: "bold")[
  Auf Mikrocontroller-Boards wird häufig
  direkt die OpenThread CLI verwendet.
]

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – CLI Command Reference
]


== Wichtige CLI-Befehle

#table(
  columns: (1.3fr, 2.2fr),
  stroke: 0.8pt + rgb("#dddddd"),
  inset: 9pt,

  table.header(
    [*Befehl*],
    [*Funktion*],
  ),

  [`state`],
  [Aktuelle Thread-Rolle anzeigen],

  [`ipaddr`],
  [IPv6-Adressen anzeigen],

  [`neighbor table`],
  [Nachbarn untersuchen],

  [`router table`],
  [Router und Routinginformationen],

  [`dataset active`],
  [Aktiven Netzwerkdatensatz anzeigen],

  [`ping <IPv6-Adresse>`],
  [IPv6-Erreichbarkeit prüfen],
)

#v(0.8em)

#text(size: 12pt)[
  Beispiel auf einem Border Router:
]

```sh
sudo ot-ctl state
sudo ot-ctl ipaddr
sudo ot-ctl router table
```

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – CLI Command Reference
]


== Netzwerkaufbau: Grundlegender Ablauf

#align(center)[
  #table(
    columns: (auto, 1fr),
    stroke: 0.8pt + rgb("#dddddd"),
    inset: 10pt,

    [*1*], [Netzwerkparameter festlegen],
    [*2*], [Thread-Schnittstelle aktivieren],
    [*3*], [Thread-Protokoll starten],
    [*4*], [Weitere Geräte mit gültigen Zugangsdaten verbinden],
    [*5*], [Rollen und Erreichbarkeit prüfen],
  )
]

#v(1em)

*Beispiel: Neues Testnetz auf einem CLI-Gerät*

```sh
dataset init new
dataset commit active
ifconfig up
thread start
state
```

#v(1fr)
#text(size: 9pt, fill: gray)[
  Quelle: OpenThread – CLI Command Reference
]
