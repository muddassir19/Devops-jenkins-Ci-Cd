# Devops-jenkins-Ci-Cd

![Ansible-Docker](https://user-images.githubusercontent.com/102643522/236632280-6176b7ce-25fa-4468-815a-582bd0f6b9cc.jpg)

Devops project. maven and java based project using jenkins CI-CD

# Jenkins CI-CD Pipeline,Maven,Docker Container,tomact and using Ansible Deploy Docker Container to Dev-server or other-server.
------------------------------------------------------------------------------------------
Docker error in Jenkins Pipeline..

Docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
------------------------------------------------------------------------------------
My first solutions was:

usermod -aG docker jenkins
usermod -aG root jenkins
chmod 664 /var/run/docker.sock
But none of them work for me, I tried:

chmod 777 /var/run/docker.sock
If using jenkins
The user jenkins needs to be added to the group docker:

sudo usermod -a -G docker jenkins
Then restart Jenkins.

You can check it was successful by doing grep docker /etc/group and see something like this:

docker:x:998:[user]
in one of the lines.

Then change your users group ID to docker (to avoid having to log out and log in again):

newgrp docker
-------------------------------------------------------------------------------------------
My Second solutions was:

usermod -aG docker jenkins
usermod -aG root jenkins
chmod 664 /var/run/docker.sock
But none of them work for me, I tried:

chmod 777 /var/run/docker.sock
-------------------------------------------------------------------------------------------
