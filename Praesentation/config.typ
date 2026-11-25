
#import "@preview/metropolyst:0.1.0": *

// Zentrale Theme-Konfiguration
#let thread-theme = metropolyst-theme.with(

  main-background-color: white,
  
  config-info(
    title: [Thread - IPv6-basiertes Mesh-Netzwerk],
    subtitle: [Architektur, Routing und praktische Analyse],
    author: [Anthony Schmied, Lotte Richter, Jan Schiffer],
    date: datetime(day: 02, month: 12, year: 2026),
    institution: [HTW Dresden],
  ),
)

#let print_writer = true //deaktivert Zuordnungs-Tags

#let writer_with_name(name) = {
  if print_writer {
    text(name, size: 13pt)
  }
}

#let writer_lotte = writer_with_name("[Lotte]")
#let writer_jan = writer_with_name("[Jan]")
#let writer_anthony = writer_with_name("[Anthony]")
