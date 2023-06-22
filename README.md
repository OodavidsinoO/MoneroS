# Moner(oS) - Plug-and-mine
![Static Badge](https://img.shields.io/badge/Moner(oS)-black?logo=Monero&link=https%3A%2F%2Fgithub.com%2FOodavidsinoO%2FMoneroS%2F)

A minimal linux from scratch distro purely for mining monero (Zero Dev Fee).

## Download 💾

You can download the iso image from the [releases](https://github.com/OodavidsinoO/MoneroS/releases)
There are two versions of the iso image, one is for local booting and the other is for network booting.

## How to build 🔨

First install the dependencies:

```bash
sudo apt install wget make gawk gcc bc bison flex xorriso libelf-dev libssl-dev git build-essential cmake automake libtool autoconf
```

Then run the build script:

```bash
make
```
After the build is complete, you can find the iso image in the `distribution` folder.

## Usage 📘

You can use the iso image to boot a virtual machine or burn it to a usb drive and boot it on a real machine.
To use your custom config, you can edit/add `xmrigConfigUrl` kernel parameter in the `isolinux.cfg` file.
While mining, you can monitor the hashrate and other stats by visiting the web interface at `http://<ip>:8080`.
You can use Ctrl+C to stop the miner and the command of `poweroff`/`reboot`.
This minimal linux is included `stress` packlage, you can use it to test the stability of your mining rig.

Happy mining! :)

## Donate 🪙

If you like this project, you can donate to the following XMR address:
```
4AXTT8JDDZCd14LECV8dCQ1WJF4s2XrMR9k5JCk89nvHKd8CtKLBpx17p3WiYFN8KkHXDDBW4hmsZbTPTqH6Cx2KM8mvNui
```

## Links 🔗

[1] http://minimal.idzona.com

[2] https://github.com/ivandavidov/minimal

[3] https://github.com/OodavidsinoO/mo-xmrig-no-dev-fee