#
# Cookbook:: python
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'python::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'Ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'Should install python' do
      expect( chef_run ).to install_package('python')
    end
    it 'Should install python-pip' do
      expect( chef_run ).to install_package('python-pip')
    end
    it 'Should install python-flask' do
      expect( chef_run ).to install_package('python-flask')
    end
    it 'Should install libc6-dev' do
      expect( chef_run ).to install_package('libncurses5')
    end
    it { is_expected.to purge_package('/development/Python-Sample-Application/app.py') }


  end
end
