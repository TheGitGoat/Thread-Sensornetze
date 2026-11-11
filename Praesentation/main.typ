
#import "config.typ": *

// Einheitliches Theme für die gesamte Präsentation
#show: thread-theme

// Titelfolie
#title-slide()

// 01 - Einführung
#include "slides/01_introduction.typ"

// 02 - Architektur
#include "slides/02_architecture.typ"

// 03 - 6LoWPAN
#include "slides/03_6lowpan.typ"

// 04 - OpenThread
#include "slides/04_openthread.typ"

// 05 - Routing und RPL
#include "slides/05_routing.typ"

// 06 - Radio Duty Cycling
#include "slides/06_duty_cycling.typ"

// 07 - Netzwerkmanagement mit ot-ctl
#include "slides/07_ot_ctl.typ"

// 08 - IPv6-Kommunikation
#include "slides/08_ipv6.typ"

// 09 - Wireshark und OTA-Sniffing
#include "slides/09_wireshark.typ"

// 10 - Self-Healing Mesh
#include "slides/10_self_healing.typ"

// 11 - Fazit
#include "slides/11_conclusion.typ"
