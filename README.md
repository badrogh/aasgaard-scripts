# Aasgaard Scripts
This is a collection of install scripts in both bash and powershell to be used as quick installer for various technos.
Provided as-is with no guarantee or support.

## Ansible
*docker-based-awx-installer.sh
Bash script to install AWX docker based requirements. This script will prepare you to the point where you need to edit your inventory file and build the docker image.
It is recommended to run this as a non-root user with sudo privileges (e.g. "ansible") that will be made member of the docker group by the installation script.
Full instructions here https://github.com/ansible/awx/blob/devel/tools/docker-compose/README.md
