#!/bin/bash

# Install APT Dependencies
sudo apt-get update
sudo apt-get install python3 python3-pip python3-venv -y

# Create service script
cat << EOF > /opt/todo-list/todo-list.service
[Unit]
Description=Todo List
[Service]
User=jenkins
WorkingDirectory=/opt/todo-list
Environment="DATABASE_URI=$DATABASE_URI"
Environment="SECRET_KEY=$SECRET_KEY"
ExecStart=/bin/bash -c 'cd /opt/todo-list && source /opt/todo-list/venv/bin/activate && python3 /opt/todo-list/create.py && python3 /opt/todo-list/app.py'
[Install]
WantedBy=multi-user.target
EOF

# Install the app service script
sudo cp /opt/todo-list/todo-list.service /etc/systemd/system/

# Create todo list working directory and make working directory
install_dir=/opt/todo-list
sudo rm -rf $install_dir
sudo mkdir $install_dir
sudo cp -r . $install_dir
sudo chown -R jenkins:jenkins $install_dir
 
# Create and source virtual environment
python3 -m venv venv
source venv/bin/activate

# Install pip requirements
pip3 install -r requirements.txt

# Start the systemd service
sudo systemctl daemon-reload
sudo systemctl stop todo-list
sudo systemctl start todo-list
