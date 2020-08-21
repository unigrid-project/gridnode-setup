#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019-2020
# author twitter @mcarper discord @mcarper#0918
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/masternode.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='unigrid-project/UNIGRID'
# Display Name.
DAEMON_NAME='UNIGRID Core'
# Coin Ticker.
TICKER='UGD'
# Binary base name.
BIN_BASE='unigrid'
# Directory.
DIRECTORY='.unigrid'
# Conf File.
CONF='unigrid.conf'
# Port.
DEFAULT_PORT=51992
# Explorer URL.
EXPLORER_URL='http://explorer.unigrid.org/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=3000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=0


# Tip Address.
TIPS='HKSgkhmsbcHLSXHPtLXCFcHuxtCCJjhLFM'
# Dropbox Addnodes.
DROPBOX_ADDNODES='ashr5b5j9deewpq'
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='pki3zjfyw0tpek9'
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='4uzjmodkkxj2wsg'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "UNIGRID"
 _   _ _   _ ___ ____ ____  ___ ____
| | | | \ | |_ _/ ___|  _ \|_ _|  _ \
| | | |  \| || | |  _| |_) || || | | |
| |_| | |\  || | |_| |  _ < | || |_| |
 \___/|_| \_|___\____|_| \_\___|____/

UNIGRID
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- raw.githubusercontent.com/unigrid-project/masternode-setup/master/masternode.sh -O ~/___mn.sh
  COUNTER=1
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null

