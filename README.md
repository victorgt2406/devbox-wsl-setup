# Windows WSL2 Setup

Para ello primero necesitamos tener instalado wsl2 con ubuntu

Instalaremos NIX [guía](https://nixos.org/download/)

## Systemd
Seguramente tendremos que habilitar systemd

Editaremos para ello el siguiente fichero con `nano`
``` bash
sudo nano /etc/wsl.conf
```
En dicho documento copiaremos lo siguiente
``` bash
[boot]
systemd=true
```

---

Una vez se soporte systemd. Reiniciaremos wsl para que este se habilite `wsl.exe --shutdown`.
## Instalación de Nix

``` bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Tras la instalación de nix tocaremos su configuración

``` bash
sudo /etc/nix/nix.conf
```
### Configuración de Nix

En dicho fichero añadiremos la siguiente linea

``` bash
experimental-features = nix-command flakes
```

---

## Instalación de Devbox
```
curl -fsSL https://get.jetify.com/devbox | bash
```

### Configuración para los direnvs.
Es posible que direnv no este instalado, chekealo ejecutando `direnv version`.

Para instalarlo en ubuntu es:
```
sudo apt install direnv
```

Asegúrate de tener en ~/.bashrc `eval "($direnv hook bash)"`

``` bash
sudo nano ~/.bashrc
```

Posteriormente ejecuta `direnv allow`

Con esto ya tenemos un wsl2 con devbox configurado. Listo para crear y seguir desarrollando nuestros proyectos con las dependencias elejidas.