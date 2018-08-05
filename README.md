# devops environment using jenkins, vagrant and aws.

## development environment repo description
This repo was compiled using Chef 14.2 with kitchen 1.22, vagrant and packer to create automated development and production environments, in order to test the Uber Python sample application.
The CI/CD pipeline has been created using a Jenkins and has been designed to react to changes in the Python-Sample-Application repo stored at: https://github.com/manibrar/Python-Sample-Application.
Once a commit has been made the Jenkins server has been configured to create a slave AMI, test the new application and then destroy the environment.
If Jenkins completes the process with a success, it will then start a new job of spinning up an AWS server as described in the packer file.

## How to configure Jenkins server test environment
1) Link your Jenkins server to your forked Python-Sample-Application github webhook.
2) In your Jenkins test general settings specify:
  a) Github project > project url (Python app repo http link)
  b) Restrict where the project can be run > Label expression (slave node)
3) In Source code management select git and specify:
  a) Repository url (Python app repo ssh link) with respective credentials and desired branches.
4) In Build triggers select Github hook triggers.
5) In Build Environment select ssh agent and respective github ssh credentials.
6) Select build and execute shell, in the command box type:
pip install pytest --user
pip install pytest-xdist --user
sudo pip install -r requirements.txt
sudo make bootstrap
make test
7) Save and your test environment is complete, select build now to test.

## How to configure Jenkins production environment
1) Link your Jenkins server to your test project and specify 'Trigger only if build is stable'
2) Clone the environment repo form https://github.com/manibrar/sparta_global_development_environment and navigate to the root of the project in terminal. Export your AWS keys if you haven't previously and upload the repo to github.
3) Select github project and link to your environment repo.
4) Select your Amazon secret keys in the Jenkins secret key option.
5) Select build and execute shell, in the command box type:
packer validate packer.json
packer build packer.json
6) This will create an ami on your AWS which runs python, nginx and comes preinstalled with the Uber python sample app.
