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

// 03 - OpenThread
#include "slides/03_openthread.typ"

// 04 - IPV6 & 6LoWPAN
#include "slides/04_ipv6_6lowpan.typ"

// 05 - Routing & Netzwerkorganistation
#include "slides/05_routing_netzwerkorganisation.typ"

// 06 - Self-Healing Mesh
#include "slides/06_self_healing.typ"

// 07 - Duty Cycling
#include "slides/07_duty_cycling.typ"

// 08 - Netzwerkmanagement mit ot-ctl
#include "slides/08_netzwerkaufbau_ot_ctl.typ"

// 09 - IPv6-Kommunikation
#include "slides/09_ipv6_netzwerkdiagnose.typ"

// 10 - Wireshark und OTA-Sniffing
#include "slides/10_wireshark.typ"

// 11 - Fazit
#include "slides/11_conclusion.typ"

= Literaturverzeichnis

#bibliography("bibliography.bib", style: "ieee")