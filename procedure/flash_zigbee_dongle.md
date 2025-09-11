# Flash de dongle pour mise à jour
## Zigbee Dongle-E
1) Démonter la clé et la brancher au PC
2) Télécharger les drivers pour que la clé soit détectée (https://www.silabs.com/developer-tools/usb-to-uart-bridge-vcp-drivers?tab=downloads)
3) Télécharger le fichier pour flasher la clé (prendre la dernière version https://github.com/itead/Sonoff_Zigbee_Dongle_Firmware/tree/master/Dongle-E)
4) Lancer une session sur ExtraPuTTy :
  - Sélectionnez Serial, puis votre port COMX ( voir dans le Gestionnaire de périphérique), Speed à 115200
  - Maintenir le bouton Boot
  - Puis cliquez sur le bouton Reset à côté et relacher les deux boutons (Vous devriez voir sur la console marqué Gecko Bootloader, si ce n'est pas le cas, on recommence à l'étape au dessus)
3) Appuyer sur 1, des c s'affiche à l'écran
4) Choisir dans le menu d'ExtraPuTTy Xmodem pour envoyer le fichier .glb
5) Une fois le transfert fini, on peut fermer ExtraPuTTy et remonter la clé