# Projet4_Expert_DevOps TO REWRITE
 
Install Vagrant and Virtualbox on your local machine.

Now install Guest additions extension if you would like to have more functionalities inside your Virtualbox VM :

"vagrant plugin install vagrant-vbguest"

Then you just need to do "vagrant up" from the folder and it will automatically download CentOS 8 image, run it, update it, install Docker+Ansible and then it will build a Nginx Docker container with port 80 mapped to local port 80.

After execution, it will restart the VM so the GUI can initialize.

Then you could do a curl or download Firefox to visit 127.0.0.1 and check that nginx is avalaible.

STEPS : 
--> vagrant up in this repo and wait till script has finished running
--> edit /etc/gitlab/gitlab.rb and change external_url for the url you want, also enable gitlab pages by uncommenting line "pages_external_url"
--> configure "Gitlab runner" that will execute .gitlab-ci.yml instructions of the project
--> create new repository for Pelican, add permissions so gitlab-runner can read/write in it
--> initialize repository : "pelican quickstart" then sync with gitlab repo
--> create .gitlab-ci.yml so it publishes modifications (it will trigger after any modification that is not excluded in .gitignore)


Sources : 
http://docs.getpelican.com/en/3.6.3/install.html
http://docs.getpelican.com/en/3.6.3/publish.html#make
https://docs.gitlab.com/runner/install/docker.html
https://tecadmin.net/install-gitlab-on-centos-8/
https://docs.gitlab.com/ee/ci/runners/
https://docs.gitlab.com/runner/register/
https://www.jamescoyle.net/how-to/2801-gitlab-runner-error-sudo-no-tty-present-and-no-askpass-program-specified
https://docs.gitlab.com/ee/administration/pages/
