#
# Cookbook:: python
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'python'
package 'python-pip'
apt_update 'update_sources' do
  action :update
end
package 'python-flask'
package 'libncurses5-dev'
