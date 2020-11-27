[Unit]
Description=Teku Validator Client (ETH2)
Wants=network-online.target
Requires=teku-beacon-node.service
After=network-online.target teku-beacon-node.service

[Service]
Type=simple
User=tkvc
Group=tkvc
UMask=0077
Restart=always
RestartSec=10
SyslogIdentifier=tkvc
ExecStart=/usr/local/bin/teku vc \
    --log-file=/var/lib/teku/validator/teku-validator.logs \
    --data-path=/var/lib/teku \
    --validator-keys="/automnt/keystores/teku/mainnet:/automnt/keystores/teku/mainnet" \
    --network=mainnet \

[Install]
WantedBy=multi-user.target
