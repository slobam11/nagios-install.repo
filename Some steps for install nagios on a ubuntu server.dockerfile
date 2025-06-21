'Hello there '

This is a text in docker file how i install nagios on a Ubuntu server. You can configure how you want but this is the most common detials how to do ...Next week i will put ubuntu server to prometheus-Grafan to track metrics 

Steps i will put here but you already saw it 

Steps:
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz

Then we are creating a user 
Create a user
sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
sudo passwd nagios

I am extrating the stuff I download and getting in the same file 
tar -xzf nagios-4.4.6.tar.gz
cd nagios-4.4.6

I am updating the system and install nagios-plugins 
sudo apt update
sudo apt install nagios-nrpe-server nagios-plugins

We are cofigure nagios In cd/Nagios 
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install
sudo make install-init
sudo make install-commandmode
sudo make install-config 
Sudo /usr/bin/install -c -m 644 sample-config/httpd.conf 
/etc/apache2/sites-enabled/nagios.conf


Step 6: Configure Apache Configure Apache by running the following commands:
sudo a2enmod rewrite
sudo a2enmod cgi
sudo systemctl restart apache2

Step 7: Install the Nagios plugins Install the Nagios plugins by running the following commands:
cd /tmp
wget https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz
tar -xzf nagios-plugins-2.3.3.tar.gz
cd nagios-plugins-2.3.3
sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
sudo make
sudo make install

apache and nagios are up and running
