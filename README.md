# Hamster

Hamster is my ansible configuration for my home router.

If you want to use it:
1. Fork it
2. Update `group_vars/all.yml` with your own config.
3. Modify the various roles based on your network setup.
4. Update `inventory` with the IP address of your router.
5. Run `./setup.sh`.

The requirement is a router with Ubuntu Server 20.04 loaded on it, and ssh keys setup.

The goals are:
* Vanilla, secure home router with high performance.
* Eliminate bufferbloat and favor latency with little tuning.
* Allow external VPN.

I am not trying to make a generic router package here. While I think ansible is great for configuration of a specific
setup, it's not good for making generic configurations. So I suggest using this as a base or reference only -
simply fork and tweak.

# Notes

* All tunables are in `group_vars/all.yml`.
* The router auto applies updates and may reboot if necessary for a kernel upgrade. This should happen
infrequently, but is necessary to ensure the security of the device.

# Networking

The network is setup based on a four port router using a DHCP based cable mode in bridge mode. It will
need to be modified based on your own configuration.

# Wireguard

To add a user, first create a private/public keypair:

``` sh
wg genkey | tee privatekey | wg pubkey > publickey
```

Then:
1. Copy wg-client.conf.template and fill in the keys.
2. Store this somewhere for later usage. (e.g. Tomes).
2. Update wg0.conf with the new peer in this repo.
3. Set up the wireguard client. Run `qrencode -t ansiutf8 < wg-client.conf` to get a QR code for easy scanning.
