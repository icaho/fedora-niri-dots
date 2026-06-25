#!/bin/bash

VPN=`nmcli c show --active | grep vpn | awk '{print $1}' | sed -e "s/^/< /; s/*$//; s/$/ >/"`
TUN=`nmcli c show --active | grep tun | awk '{print $1}' | sed -e "s/^/< /; s/*$//; s/$/ >/"`
NRD=`nmcli c show --active | grep nordlynx | awk '{print $1}' | sed -e "s/^/< /; s/*$//; s/$/ >/"`
NRDSVR=`nordvpn status | grep Server | awk '{print $2}'`


if [ -z "$VPN" ] && [ -n "$TUN" ]; then
    echo -e "AWS Client VPN"
else
    if [ -z "$NRD" ]; then
        echo -e $VPN
    else
        echo -e "NordVPN : $NRDSVR"
    fi
fi

