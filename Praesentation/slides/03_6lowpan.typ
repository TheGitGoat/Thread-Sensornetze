
= 6LoWPAN

== Warum wird 6LoWPAN benötigt?

- IPv6 für ressourcenbeschränkte IoT-Geräte
- IEEE 802.15.4 mit kleinen Funkframes
- IPv6-Pakete können größer als Funkframes sein
- 6LoWPAN als Anpassungsschicht

== Funktionsweise von 6LoWPAN

- Header Compression
- Fragmentierung und Reassemblierung
- Weiterleitung von IPv6-Paketen
- Reduzierung des Übertragungsaufwands

// Hier später ein Diagramm zum Protokollstack einfügen

== Beispiel: IPv6 Header Compression

- IPv6-Header ursprünglich 40 Byte
- Komprimierung durch 6LoWPAN
- Nutzung gemeinsam bekannter Informationen
- Mehr Platz für Nutzdaten

// Hier später Vorher-Nachher-Vergleich einfügen
