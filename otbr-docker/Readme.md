# OpenThread Border Router

## Hardware und Voraussetzungen

- **Hardware:** Sonoff ZBDongle-E mit Silicon Labs EFR32MG21 (Cortex-M33)
- **Firmware:** OpenThread RCP-Firmware ist bereits geflashed.
- **Betrieb:** OpenThread Border Router über Docker auf Kubuntu.
- **Infrastrukturinterface:** WLAN (`wlp0s20f3`).

Docker-Installationsanleitung:  
https://openthread.io/guides/border-router/build-docker

## 1. Infrastruktur-Interface ermitteln

Mit folgendem Befehl die verfügbaren Netzwerkinterfaces anzeigen:

```bash
ip -br link
```

Beispielausgabe:

```text
lo
enp0s31f6
wlp0s20f3
```

In diesem Setup wird `wlp0s20f3` als WLAN-/Infrastrukturinterface verwendet.

## 2. IP-Forwarding aktivieren

Das OpenThread-Skript für die Host-Konfiguration ausführen.

Dabei `INFRA_IF_NAME` durch das eigene Infrastrukturinterface ersetzen:

```bash
curl -sSL https://raw.githubusercontent.com/openthread/ot-br-posix/refs/heads/main/etc/docker/border-router/setup-host | sudo env INFRA_IF_NAME=wlp0s20f3 bash
```

Das Skript richtet die benötigten Host-Netzwerkeinstellungen ein.

Anschließend IP-Forwarding überprüfen:

```bash
sysctl net.ipv4.ip_forward
sysctl net.ipv6.conf.all.forwarding
```

Erwartetes Ergebnis:

```text
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
```

## 3. Docker-Image herunterladen

```bash
docker pull openthread/border-router:latest
```

## 4. Serielles Gerät des Dongles ermitteln

Den Gerätepfad des Sonoff-Dongles herausfinden:

```bash
ls -l /dev/serial/by-id/
```

Beispielausgabe:

```text
usb-Itead_Sonoff_Zigbee_3.0_USB_Dongle_Plus_V2_2e8f12499f78f011ad3ca6e70ba521c7-if00-port0 -> ../../ttyUSB0
```

**Wichtig:**

Der Dongle wird auf diesem System als `ttyUSB0` erkannt, wenn er als was anderes erkannt wird, muss man das bei nachfolgenden Eingaben ersetzen. Genauso wie die ID des Geräts.

Der stabile Gerätepfad unter `/dev/serial/by-id/` wird später in den Docker-Container eingebunden und dort auf `/dev/ttyUSB0` abgebildet.

## 5. Umgebungsdatei `otbr-env.list`

Die Datei liegt im Projektverzeichnis `otbr-docker`.

Inhalt:

```ini
OT_RCP_DEVICE=spinel+hdlc+uart:///dev/ttyUSB0?uart-baudrate=921600
OT_INFRA_IF=wlp0s20f3
OT_THREAD_IF=wpan0
OT_LOG_LEVEL=7
```

**Hinweise:**

- `OT_RCP_DEVICE`: Serielle Verbindung zum Sonoff-Dongle.
- `OT_INFRA_IF`: WLAN-Infrastrukturinterface.
- `OT_THREAD_IF`: Virtuelles Thread-Interface.
- `OT_LOG_LEVEL`: Log-Level.

## 6. Docker-Container starten

Den folgenden Befehl im gleichen Verzeichnis ausführen, in dem sich `otbr-env.list` befindet.

Alternativ muss bei `--env-file` der vollständige Dateipfad angegeben werden.

```bash
sudo docker run \
  --name=otbr \
  --detach \
  --network=host \
  --cap-add=NET_ADMIN \
  --device=/dev/serial/by-id/usb-Itead_Sonoff_Zigbee_3.0_USB_Dongle_Plus_V2_2e8f12499f78f011ad3ca6e70ba521c7-if00-port0:/dev/ttyUSB0 \
  --device=/dev/net/tun \
  --volume=/var/lib/otbr:/data \
  --env-file=otbr-env.list \
  --restart=always \
  openthread/border-router:latest
```

### Erklärung der Docker-Parameter

| Parameter | Funktion |
|---|---|
| `--name=otbr` | Name des Containers |
| `--detach` | Container im Hintergrund starten |
| `--network=host` | Host-Netzwerk verwenden |
| `--cap-add=NET_ADMIN` | Netzwerkadministration erlauben |
| `--device` | Sonoff-Dongle durchreichen |
| `/dev/net/tun` | Virtuelles Netzwerkinterface bereitstellen |
| `--volume` | Persistente Daten speichern |
| `--env-file` | Umgebungsvariablen laden |
| `--restart=always` | Container automatisch neu starten |

## 7. Container überprüfen

Containerstatus anzeigen:

```bash
sudo docker ps -a
```

Logs anzeigen:

```bash
sudo docker logs -f otbr
```

Eine erfolgreiche RCP-Verbindung erkennt man beispielsweise an folgender Meldung:

```text
Radio Co-processor version: SL-OPENTHREAD/3.1.1.0_GitHub-fb274efe6; EFR32
```

Damit ist bestätigt, dass der OTBR-Agent die OpenThread-RCP-Firmware auf dem EFR32MG21 erkennt.

Der Border Router sollte jetzt auch eine GUI haben die unter `http://localhost:8080/` erreichbar ist.

## 8. OpenThread CLI aufrufen

Die OpenThread-CLI innerhalb des Containers starten:

```bash
sudo docker exec -it otbr ot-ctl
```

Thread-Status abfragen:

```text
state
```

RCP-Informationen abfragen:

```text
rcp
```

CLI verlassen:

```text
exit
```

Wenn das Thread-Netzwerk noch nicht gestartet ist, kommen Fehlermeldungen bei `state` und `rcp`.



## Ergebnis

Der OpenThread Border Router läuft als Docker-Container und kommuniziert über UART mit dem Sonoff ZBDongle-E (EFR32MG21).

**Hinweis:** Das Starten des Containers bedeutet noch nicht, dass ein Thread-Netzwerk eingerichtet ist. Die Erstellung eines Thread-Datasets, der Start des Thread-Netzwerks sowie IPv6-Routing und Netzwerkerreichbarkeit müssen anschließend separat konfiguriert und überprüft werden.

## Thread-Netzwerk aufbauen

Siehe https://openthread.io/guides/border-router/form-network#form-a-thread-network

### IKEA Steckdocke als Node hinzufügen
Die Steckdose spricht nur Matter, deswegen muss das `chip-tool` installiert werden, um über die Kommandozeile mit der Steckdose zu kommunizieren

Steckdose anmelden:
```text
chip-tool pairing code-thread 1 hex:THREAD_DATASET MATTER_SETUP_CODE
````

Dabei gilt:
- `1` ist eine frei gewählte Geräte-ID.
- `THREAD_DATASET` ist die Ausgabe von `dataset active -x` in der Thread-CLI
- `MATTER_SETUP_CODE` ist der numerische Matter-Einrichtungscode deiner GRILLPLATS (`0236-961-8092`).

## Ping Node inside the network

Execute in the CLI:
```text
> prefix
fda7:ebeb:12ae:1::/64 paos low 0800
Done

> netdata show
Prefixes:
fda7:ebeb:12ae:1::/64 paos low 0800
Routes:
fc00::/7 sa med 0800
fda7:ebeb:12ae:2:0:0::/96 sn low 0800
Services:
44970 5d fd30b2399a5c5c8f4914fa6792180132d11f s 0800 0
44970 01 4e000500000e10 s 0800 1
Contexts:
fda7:ebeb:12ae:1::/64 1 sc
Commissioning:
53264 - - -
Done
```

**Mesh Local Prefix**: `fda7:ebeb:12ae:1::/64`

### IPv6 address
The address is build with `Mesh-Local-Präfix + 0000:00ff:fe00:RLOC16`

Example:
```
> child table
| ID  | RLOC16 | Timeout    | Age        | LQ In | C_VN |R|D|N|Ver|CSL|QMsgCnt|Suprvsn| Extended MAC     |
+-----+--------+------------+------------+-------+------+-+-+-+---+---+-------+-------+------------------+
|   1 | 0x0801 |        240 |          8 |     3 |  216 |0|0|0|  4| 0 |     0 |   129 | b229ae4b6a99deb7 |
|   2 | 0x0802 |        240 |          6 |     3 |  216 |0|0|0|  4| 0 |     0 |   129 | eefa0f3236996bda |
```

**Child ID=1**:
RLOC16 = `0x0801` IPv6: `fda7:ebeb:12ae:1:0:ff:fe00:801`