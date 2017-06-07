require 'spec_helper'

#describe package('iterm2'), :if => os[:family] == 'darwin' do
#  it { should be_installed }
#end

describe package('tree') do
  it { should be_installed }
end

describe package('tmux') do
  it { should be_installed }
end

describe command('tmux -V') do
  its(:stdout) { should match /2.3/ }
end

describe package('wget') do
  it { should be_installed }
end

describe package('the_silver_searcher'), :if => os[:family] == 'darwin' do
  it { should be_installed }
end
