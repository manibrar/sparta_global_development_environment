#
# Cookbook:: python
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end
package 'python'
package 'python-pip'
package 'python-flask'
package 'libncurses5-dev'
