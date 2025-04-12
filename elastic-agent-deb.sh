#!/bin/bash
#Bash script for reconfiguring elastic-agent 
#Exit Codes:
#	0: Success

								
#Install the ca.crt of the new environment in the trusted CAs
sudo apt-get install -y ca-certificates
update-ca-trust force-enable
cp /root/elastic-ca.crt /usr/local/share/ca-certificates/.
update-ca-trust extract
#Install and configure elastic agent
mkdir /opt/fleet/
cd /opt/fleet/
cp /root/elastic-agent-8.11.2-linux-x86_64.tar.gz .
tar xzvf elastic-agent-8.11.2-linux-x86_64.tar.gz
cd /opt/fleet/elastic-agent-8.11.2-linux-x86_64/ 
cp /root/elastic-ca.crt /opt/fleet/elastic-agent-8.11.2-linux-x86_64/.
cp /root/fleet.crt /opt/fleet/elastic-agent-8.11.2-linux-x86_64/.

sudo ./elastic-agent install -f --url= https://elastic-master:8220 \
--enrollment-token=ekZFVE1JMEJEbEFycl9NSVU0RDA6Z293MVhVYnFSU1cyVWJtbTRBUXRJZw==

exit 0 
