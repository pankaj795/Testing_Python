#!/bin/bash

#  This is a bash script for GUI
 

#version 1.0.4
 
#======================================================#
#           Set Script Variables                       #
#======================================================#

# Set base path from executed command (relative or full path works)
#base_path="$(echo ${0} | sed 's/installer.sh//')"
BASEDIR=$(realpath "${BASH_SOURCE:-$0}")
BASEDIR=$(dirname $BASEDIR)

# Set log file and script locations
guipostinstall_log="/tmp/guipostinstall.log"

# Checking the Os and Version
while IFS='=' read -r key value; do
    case "$key" in
        DISTRIB_ID)
            distrib_id="$value"
            ;;
        DISTRIB_RELEASE)
            distrib_release="$value"
            ;;
    esac
done < /etc/lsb-release

# Check if DISTRIB_ID is "Ubuntu" and DISTRIB_RELEASE is "22.04"
if [ "$distrib_id" = "Ubuntu" ] && [ "$distrib_release" = "22.04" ]; then
    echo " Ubuntu 22.04 is there script is ready to run"
else
    echo "Error: This script is only compatible with Ubuntu 22.04."
    exit 1
fi

echo "===========================================" >> ${guipostinstall_log}
echo "   Log Started: $(date)                    " >> ${guipostinstall_log}
echo "===========================================" >> ${guipostinstall_log}
echo "===========================================" >> ${guipostinstall_log}
echo "    Installing AttackFence GUI             " >> ${guipostinstall_log}
echo "===========================================" >> ${guipostinstall_log}
echo "===========================================" 
echo "    Installing AttackFence GUI             " 
echo "==========================================="
echo "Installing...>> Log Started: $(date) and log file location is ${guipostinstall_log}..."
echo "Installing...>> Log Started: $(date) and log file location is ${guipostinstall_log}..."  >> ${guipostinstall_log}

# Set the username you want to create
username="guimanager"
echo "Installing...>> User $username is creating." >> ${guipostinstall_log}
echo "Installing...>> User $username is creating."

# Create the user with the adduser command
sudo adduser --disabled-password --gecos "" $username
sudo passwd $username
# Add the user to specific groups if needed
sudo usermod -aG sudo $username
sudoers_file="/etc/sudoers.d/$username"
echo "$username ALL=(ALL) NOPASSWD: /usr/bin/dpkg" | sudo tee "$sudoers_file"

sudo chmod 440 "$sudoers_file"
echo "User '$username' has been created and given sudo privileges."

# Print a message indicating the user creation is complete
echo "Installing...>> User $username has been created." >> ${guipostinstall_log}
echo "Installing...>> User $username has been created."


echo "Installing...>> Installing Nginx Server Please wait..." >> ${guipostinstall_log}
echo "Installing...>> Installing Nginx Server Please wait..." 
#su - guimanager
#sudo dpkg -i $BASEDIR/nginx-package-1.80.0/*

# Check if Nginx is installed
if dpkg -l nginx &> /dev/null; then
  echo "Nginx is already installed."
else
  # Install Nginx
  dpkg -i $BASEDIR/nginx-package-1.80.0/* 2> /dev/null >> $guipostinstall_log
  echo "Nginx installed."
  echo "Installing...>> Nginx server install successfully."
  echo "Installing...>> Nginx server install successfully." >> ${guipostinstall_log}

fi
#dpkg -i $BASEDIR/nginx-package-1.80.0/* 2> /dev/null >> ${guipostinstall_log}

echo "Installing...>> Nginx server install successfully."
echo "Installing...>> Nginx server install successfully." >> ${guipostinstall_log}

#Installation of nodejs 
sudo cp -r node-v15.6.0-linux-x64/* /usr/local/
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

mkdir -p /usr/lib/node_modules/
mkdir -p /usr/lib/node_modules/node

# Installing the node 
tar -xJf $BASEDIR/node-v15.6.0-linux-x64.tar.xz -C /usr/lib/node_modules/node
cp /usr/lib/node_modules/node/node-v15.6.0-linux-x64/bin/node /usr/bin/
ln -sf /usr/lib/node_modules/node/node-v15.6.0-linux-x64/bin/node  /usr/bin/



#Installation of pm2 
mkdir -p /usr/lib/node_modules/
mkdir -p /usr/lib/node_modules/node
NODEDIR="/usr/lib/node_modules/"
tar -zxvf $BASEDIR/pm2-5.2.2.tgz -C "$NODEDIR" >> ${guipostinstall_log}
cp -r "$NODEDIR"/package "$NODEDIR"/pm2  >> ${guipostinstall_log}

# Creating the symlink between the folders
ln -sf "$NODEDIR"/pm2/bin/pm2 /usr/bin/ >> ${guipostinstall_log}
ln -sf "$NODEDIR"/pm2/bin/pm2-dev /usr/bin/ >> ${guipostinstall_log}
ln -sf "$NODEDIR"/pm2/bin/pm2-docker /usr/bin/ >> ${guipostinstall_log}
ln -sf "$NODEDIR"/pm2/bin/pm2-runtime /usr/bin/ >> ${guipostinstall_log}
echo "Installing...>> pm2 installed successfully."
echo "Installing...>> pm2 installed successfully." >> ${guipostinstall_log}




# update nginx default configuration
echo "Installing...>> Update nginx default configuration file..."
echo "Installing...>> Update nginx default configuration file..." >> ${guipostinstall_log}
cp -r $BASEDIR/default /etc/nginx/sites-available
cp -r $BASEDIR/nginx.conf  /etc/nginx
mkdir -p  /var/lib/attackfence
cp -r $BASEDIR/attackfence_db/*  /var/lib/attackfence

TARGET_DIR="/var/lib/attackfence"
OWNER="guimanager"
GROUP="attackfence"
find "$TARGET_DIR" -exec chown "$OWNER:$GROUP" {} \;

echo "Installing...>> Nginx default configuration file updated successfully." >> ${guipostinstall_log}
echo "Installing...>> Nginx default configuration file updated successfully."

echo "Installing...>> Copy attackfence folder to /var/www/html" >> ${guipostinstall_log}
echo "Installing...>> Copy attackfence folder to /var/www/html"
cp -r  $BASEDIR/attackfence  /var/www/html/ 
sudo chown -R $OWNER:$GROUP /var/www/html/attackfence 
echo "Installing...>> Restart nginx service..."
echo "Installing...>> Restart nginx service..." >> ${guipostinstall_log}
systemctl restart nginx.service 

if [ $? -eq 0 ]; then
    echo "Installing...>> Nginx service restarted successfully."
    echo "Installing...>> Nginx service restarted successfully." | tee -a ${guipostinstall_log}
else
    echo -e "Installing...>> Failed to restart Service nginx." | tee -a ${guipostinstall_log}
    echo -e "Installing...>> Failed to restart Service nginx." | tee -a ${guipostinstall_log}
fi


# Define the directory path
LOG_DIR="/var/log/attackfence/gui"

# Create the directory if it doesn't exist
sudo mkdir -p "$LOG_DIR"

# Create error.log and service.log files
sudo touch "$LOG_DIR/error.log"
sudo touch "$LOG_DIR/service.log"

# Set the ownership to guimanager:attackfence
sudo chown -R $OWNER:$GROUP "$LOG_DIR/error.log"
sudo chown -R  $OWNER:$GROUP "$LOG_DIR/service.log"

# Optionally, you can set the permissions for these files
sudo chmod 664 "$LOG_DIR/error.log"
sudo chmod 664 "$LOG_DIR/service.log"


# copy certs folder to attackfence
echo "Installing...>> Create certs folder in to /etc/attackfence" >> ${guipostinstall_log}
echo "Installing...>> Create certs folder in to /etc/attackfence"

cp -r $BASEDIR/certs/  /etc/attackfence/
chown -R $OWNER:$GROUP /etc/attackfence/certs/

echo "Installing...>> certs folder created successfully"
echo "Installing...>> certs folder created successfully" >> ${guipostinstall_log}

echo "Installing...>> Copy all GUI service for server to /user/bin" >> ${guipostinstall_log}

sudo mkdir -p /opt/attackfence/gui/
cp -r $BASEDIR/gui_services  /opt/attackfence/gui/
cp -r $BASEDIR/gui_unit_services   /opt/attackfence/gui/
chown -R $OWNER:$GROUP /opt/attackfence/gui/
systemctl daemon-reload
# Set the source directory containing the service files
#cp $BASEDIR/gui_unit_services  /etc/attackfence/
SOURCE_DIR="/opt/attackfence/gui/gui_unit_services"
DEST_DIR="/etc/systemd/system"
# Check if the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
  echo "Destination directory $DEST_DIR not found. Exiting..."
  exit 1
fi
# Copy and register services
for service_file in "$SOURCE_DIR"/*.service; do
  if [ -f "$service_file" ]; then
    service_name=$(basename "$service_file")
    echo "Registering $service_name"
    sudo cp "$service_file" "$DEST_DIR"
    sudo systemctl start "$service_name"
    sudo systemctl enable "$service_name"
    sudo systemctl status "$service_name"
  fi
done

# creating the symlink between the services 

SOURCE_PATH_EDR_CONFIGURATION=/opt/attackfence/gui/gui_unit_services/atf_edr_configuration.service 
DESTINATION_PATH_EDR_CONFIGURATION=/etc/systemd/system/atf_edr_configuration.service
sudo ln -sf "$SOURCE_PATH_EDR_CONFIGURATION" "$DESTINATION_PATH_EDR_CONFIGURATION"

SOURCE_PATH_HEALTH_PUBLISHER=/opt/attackfence/gui/gui_unit_services/atf_gui_health_publisher.service 
DESTINATION_PATH_HEALTH_PUBLISHER=/etc/systemd/system/atf_gui_health_publisher.service
sudo ln -sf "$SOURCE_PATH_HEALTH_PUBLISHER" "$DESTINATION_PATH_HEALTH_PUBLISHER"

SOURCE_PATH_HEALTH_SUBSCRIBE=/opt/attackfence/gui/gui_unit_services/atf_gui_health_subscribe.service
DESTINATION_PATH_HEALTH_SUBSCRIBE=/etc/systemd/system/atf_gui_health_subscribe.service
sudo ln -sf "$SOURCE_PATH_HEALTH_PUBLISHER" "$DESTINATION_PATH_HEALTH_PUBLISHER"

SOURCE_PATH_ROLLUP_PUBLISHER=/opt/attackfence/gui/gui_unit_services/atf_gui_rollup_publisher.service
DESTINATION_PATH_ROLLUP_PUBLISHER=/etc/systemd/system/atf_gui_rollup_publisher.service
sudo ln -sf "$SOURCE_PATH_ROLLUP_PUBLISHER" "$DESTINATION_PATH_ROLLUP_PUBLISHER"

SOURCE_PATH_ROLLUP_SUBSCRIBER=/opt/attackfence/gui/gui_unit_services/atf_gui_rollup_subscriber.service
DESTINATION_PATH_ROLLUP_SUBSCRIBER=/etc/systemd/system/atf_gui_rollup_subscriber.service
sudo ln -sf "$SOURCE_PATH_ROLLUP_SUBSCRIBER" "$DESTINATION_PATH_ROLLUP_SUBSCRIBER"

SOURCE_PATH_MNGR_CONFIG=/opt/attackfence/gui/gui_unit_services/atf_mngr_config_update.service
DESTINATION_PATH_MNGR_CONFIG=/etc/systemd/system/atf_mngr_config_update.service
sudo ln -sf "$SOURCE_PATH_MNGR_CONFIG" "$DESTINATION_PATH_MNGR_CONFIG"

SOURCE_PATH_NDR_CONFIGURATION=/opt/attackfence/gui/gui_unit_services/atf_ndr_configuration.service
DESTINATION_PATH_NDR_CONFIGURATION=/etc/systemd/system/atf_ndr_configuration.service
sudo ln -sf "$SOURCE_PATH_NDR_CONFIGURATION" "$DESTINATION_PATH_NDR_CONFIGURATION"




# starting the server
echo "Installing...>> Start server from pm2..." >> ${guipostinstall_log}
echo "Installing...>> Start server from pm2...." >> ${guipostinstall_log}

pm2 start /var/www/html/attackfence/server
echo "Installing...>> Started server from pm2 successfully." >> ${guipostinstall_log}
echo "Installing...>> Started server from pm2 successfully." >> ${guipostinstall_log}
echo "Installing...>> Installing... installed successfully. Now you open url https://server_ip/"
echo "Installing...>> Installing... installed successfully. Now you open url https://server_ip/" >> ${guipostinstall_log}