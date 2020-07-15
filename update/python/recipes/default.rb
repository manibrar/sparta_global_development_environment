#
# Cookbook:: python
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'update_sources' do
  action :update
end
package 'python'

package 'python-flask'
package 'libc6-dev'
