# Projet4_Expert_DevOps
 
Install Vagrant and Virtualbox on your local machine.

Now install Guest additions extension if you would like to have more functionalities inside your Virtualbox VM :

"vagrant plugin install vagrant-vbguest"

Then you just need to do "vagrant up" from the folder and it will automatically download CentOS 8 image, run it, update it, install Docker+Ansible and then it will build a Nginx Docker container with port 80 mapped to local port 80.

After execution, it will restart the VM so the GUI can initialize.

Then you could do a curl or download Firefox to visit 127.0.0.1 and check that nginx is avalaible.