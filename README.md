# Hamster

Hamster is my ansible configuration for my home router.

If you want to use it:
1. Fork it
2. Update `group_vars/all.yml` with your own config.
3. Modify the various roles based on your network setup.
4. Update `inventory` with the IP address of your router.
5. Run `./setup.sh`.

The requirement is a router with Debian loaded on it, and ssh keys setup.

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

The network is setup based on a four port router using UK's openreach FTTC, which uses vDSL and pppoe. It will
need to be modified based on your own configuration.
