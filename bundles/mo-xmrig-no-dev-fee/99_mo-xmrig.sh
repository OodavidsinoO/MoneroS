#!/bin/sh

XMRIG_CONFIG_FILE=/etc/mo-xmrig-config.json
# Get kernel launch parameters, xmrigConfigUrl
KERNEL_LAUNCH_PARAMETERS=$(cat /proc/cmdline)
XMRIG_CONFIG_URL=$(echo $KERNEL_LAUNCH_PARAMETERS | grep -oP '(?<=xmrigConfigUrl=)[^ ]+')

echo -e "[MO-XMRIG] \\e[0;33mDetecting xmrigConfigUrl from kernel launch parameters.\\e[0m"
# Check xmrigConfigUrl is not empty and download config file
if [ ! -z "$XMRIG_CONFIG_URL" ]; then
    echo -e "[MO-XMRIG] xmrigConfigUrl is \\e[0;32m{$XMRIG_CONFIG_URL}\\e[0m"
    echo "[MO-XMRIG] Downloading xmrig config file"
    wget -O $XMRIG_CONFIG_FILE $XMRIG_CONFIG_URL && echo -e "[MO-XMRIG] \\e[0;32mxmrig config file downloaded\\e[0m"
else
    echo "[MO-XMRIG] \\e[0;31mxmrigConfigUrl is empty\\e[0m"
fi

# Check xmrig config file exists
if [ -f "$XMRIG_CONFIG_FILE" ]; then
    echo -e "[MO-XMRIG] \\e[0;32mxmrig config file exists\\e[0m"
else
    echo -e "[MO-XMRIG] \\e[0;31mxmrig config file does not exist\\e[0m"
fi

# Run xmrig
echo "[MO-XMRIG] STARTING XMRIG"
mo-xmrig -c $XMRIG_CONFIG_FILE