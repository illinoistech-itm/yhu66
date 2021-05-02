Set-Location -path ../../build/db

vagrant box add ./db-virtualbox-1617409318.box --name db-backend

Copy-Item ../../build-scripts/vagrantfile/Database_Vagrantfile -Destination ./Vagrantfile

vagrant up

Set-Location -path ../frontend

vagrant box add ./frontend-virtualbox-1617409319.box --name web-frontend

Copy-Item ../../build-scripts/vagrantfile/WebServer_Vagrantfile -Destination ./Vagrantfile

vagrant up

vagrant ssh -c "python3 2021-team02t/sprint-04/code/website/src/manage.py migrate"
vagrant ssh -c "python3 2021-team02t/sprint-04/code/website/src/manage.py runserver 0.0.0.0:3000"

Set-Location -path ../../build-scripts/vagrantfile
