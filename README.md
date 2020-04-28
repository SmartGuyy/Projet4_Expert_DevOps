# Projet4_Expert_DevOps TO REWRITE
 
Install Vagrant and Virtualbox on your local machine.

Now install Guest additions extension if you would like to have more functionalities inside your Virtualbox VM :

"vagrant plugin install vagrant-vbguest"

Then you just need to do "vagrant up" from the folder and it will automatically download CentOS 8 image, run it, update it, install Docker+Ansible and then it will build a Nginx Docker container with port 80 mapped to local port 80.

After execution, it will restart the VM so the GUI can initialize.

Then you could do a curl or download Firefox to visit 127.0.0.1 and check that nginx is avalaible.

STEPS : 
--> vagrant up in this repo and wait till script has finished running
--> edit /etc/gitlab/gitlab.rb and change external_url for the url you want"
--> configure "Gitlab runner" (shell) that will execute .gitlab-ci.yml instructions of the project
--> create new repository for Pelican with Gitlab-runner account, add permissions so gitlab-runner can read/write in it
--> initialize repository : "pelican quickstart" then sync with gitlab repo
--> create .gitlab-ci.yml so it publishes modifications (it will trigger after any modification that is not excluded in .gitignore)
--> create Github repository called [username].github.io 
--> go on the settings of this repository and import a public key that you generated from VM (ssh-keygen -t rsa -C "your_mail_adress_used_github@xxx.com")
--> clone github.io repository WITH SSH
--> verify that account executed by gitlab-runner can add new files, commit and push them to this repository without username/password
--> modify Pelican configuration file so output path is your gitlab.io local repository
--> create .gitlab-ci.yml with following commands :
- "rsync -a -r" content of /srv/blog/public directory (or whatever path to your Pelican local repository) to your gitlab.io local repository
- "make publish" 
- "cd" to Github.io local repository, 
- "git add." 
- "git commit -m "your message""
- "git push -u".

--> Now write articles from Gitlab on your Pelican's repository and it will be automatically updated on your github.io static website at each commit.


Sources : 
http://docs.getpelican.com/en/3.6.3/install.html
http://docs.getpelican.com/en/3.6.3/publish.html#make
https://docs.gitlab.com/runner/install/docker.html
https://tecadmin.net/install-gitlab-on-centos-8/
https://docs.gitlab.com/ee/ci/runners/
https://docs.gitlab.com/runner/register/
https://zzpanqing.github.io/2017/02/28/github-push-without-username-and-password.html
https://pages.github.com/

