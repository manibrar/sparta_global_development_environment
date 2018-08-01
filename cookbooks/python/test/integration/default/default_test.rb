# # encoding: utf-8

# Inspec test for recipe python::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe package 'python' do
  it { should be_installed }
end

describe package 'python-pip' do
  it { should be_installed }
end

describe package 'python-flask' do
  it { should be_installed }
end

describe package 'libncurses5' do
  it { should be_installed }
end
