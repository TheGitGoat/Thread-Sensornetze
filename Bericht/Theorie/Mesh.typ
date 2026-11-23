== Mesh Link Establishment
Relevante Entitäten:
-Extender-Capable Device (ECD)


Thread Netzwerk
Identifier 	Value
PAN ID 	0xBEEF
XPAN ID 	0xBEEF1111CAFE2222
Network Name 	yourThreadCafe

*Verbindung eines neuen Teilnehmers*
1. Das Gerät sendet einen 802.15.4 Beacon Request auf einem bestimmten Kanal
2. Jedes ECD in der Nähe antwortet mit seiner PAN ID, XPAN ID und Netzwerkname
3. Das Gerät führt diese Schritte auf jeden Kanal aus

anschließend entscheidet das Gerät, mit welchem Netzwerk auf welchem ECD es sich verbindet. Ist kein passendes Netzwerk erreichbar kann auch ein neues Netz erstellt werden.

== Dynamisches Rerouting