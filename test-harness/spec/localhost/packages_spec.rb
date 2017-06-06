require 'spec_helper'

describe package('docker'), :if => os[:family] == 'darwin' do
  it { should be_installed }
end
