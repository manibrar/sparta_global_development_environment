# required_plugins = %w( "vagrant-hostsupdater",  "vagrant-berkshelf" )
# required_plugins.each do |plugin|
#     exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
# end

Vagrant.configure("2") do |config|

  config.vm.define "development" do |development|
    development.vm.box = "ubuntu/xenial64"
    ENV['LC_ALL']="en_US.UTF-8"
    ENV['LC_CTYPE']="en_US.UTF-8"
    development.vm.network "private_network", ip: "192.168.10.100"
    development.hostsupdater.aliases = ["development.local"]

    # Synced app folder
    development.vm.synced_folder "development", "/development"

    # provision with chef
    development.vm.provision "chef_solo" do |chef|
        chef.add_recipe "python::default"
    end

    # Initialise development environment
    config.vm.provision "shell", inline: <<-SHELL
    echo "Updating virtual machine..."
    sudo UBUNTU_FRONTEND=noninteractive apt-get update

    echo "Installing swift prerequisites..."
    sudo UBUNTU_FRONTEND=noninteractive apt-get install -y libncurses5-dev

    echo "Developed by Manvir 'MasterChef' Brar"
    SHELL
  end

  # config.vm.define "production" do |production|
  #   production.vm.box = "ubuntu/xenial64"
  #   production.vm.network "private_network", ip: "192.168.10.150"
  #   production.hostsupdater.aliases = ["database.local"]
  #
  #   # provision with chef
  #   production.vm.provision "chef_solo" do |chef|
  #       chef.add_recipe "mongo-server::default"
  #   end
  # end
end
