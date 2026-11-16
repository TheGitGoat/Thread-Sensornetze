#import "@preview/metropolyst:0.1.0": *
#import "config.typ": *

// Einheitliches Theme für die gesamte Präsentation
#show: thread-theme

// Titelfolie
#title-slide()

// 01 - Einführung
#include "slides/01_introduction.typ"

// 02 - Architektur
#include "slides/02_architecture.typ"

// 03 - IPV6 & 6LoWPAN
#include "slides/03_ipv6_6lowpan.typ"

// 04 - Routing & Netzwerkorganistation
#include "slides/04_routing_netzwerkorganisation.typ"

// 05 - Duty Cycling
#include "slides/05_duty_cycling.typ"

// 06 - OpenThread
#include "slides/06_openthread.typ"

// 07 - Netzwerkmanagement mit ot-ctl
#include "slides/07_netzwerkaufbau_ot_ctl.typ"

// 08 - IPv6-Kommunikation
#include "slides/08_ipv6_netzwerkdiagnose.typ"

// 09 - Wireshark und OTA-Sniffing
#include "slides/09_wireshark.typ"

// 10 - Self-Healing Mesh
#include "slides/10_self_healing.typ"

// 11 - Fazit
#include "slides/11_conclusion.typ"

= Literaturverzeichnis

#bibliography("bibliography.bib", style: "ieee")