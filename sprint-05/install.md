# Installation Instruction

* Git clone https://github.com/illinoistech-itm/2021-team02t.git into a directory on your computer

* Replace the following lines in the following files with your key and/or your repository:

sprint-05/build-scripts/ubuntu18045-sample-server.json - lines - 119, 133, 134 and 137

sprint-05/build-scripts/config - line - 3

sprint-05/build-scripts/provisioner-scripts/dbscript.sh - lines - 74, 75, 80 and 82

sprint-05/build-scripts/provisioner-scripts/django_script.sh - lines - 12, 13, 14, 15 and 22

sprint-05/build-scripts/provisioner-scripts/frontendscript.sh - lines - 68, 69, 71 and 72

sprint-05/build-scripts/provisioner-scripts/post_install_mysql-install.sh - lines - 42, 45, 46, 48, 50, 52, 54, 56 and 58

sprint-05/build-scripts/provisioner-scripts/post_install_reactjs-app-and-dependencies.sh - lines - 13, 14 and 19

* In Terminal navigate into sprint-05/build-scripts and run `packer build --var-file ./variables.json /your/path/to/this/directory/on/your/computer/2021-team02t/sprint-05/build-scripts/ubuntu18045-sample-server.json`

* After the build is completed, two boxes should be created.

* Navigate to sprint-05/build-scripts/vagrantfile/Start_Boxes.ps1 and change lines 3 and 11 to reflect your build boxes names

* Navigate to sprint-05/build-scripts/vagrantfile/Start_Site.ps1 and change lines 3 and 11 to reflect your build boxes names

* In Powershell Terminal navigate to sprint-05/build-scripts/vagrantfile/ and run .\Start_Boxes.ps1

* Wait for the initializing of the boxes and starting of the server, after that open a local browser and type http://192.168.33.33:3000 to access Bugville website
