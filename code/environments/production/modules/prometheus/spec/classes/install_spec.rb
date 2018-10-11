require 'spec_helper'

describe 'prometheus::install' do
  context 'for a Linux based operating system' do
    let(:facts) {{ :kernel => 'Linux' }}

    it do
      should contain_package('prometheus').with({
        'ensure' => 'installed',
        'provider' => 'yum',
      })
    end
  end

  context 'for an unsupported OS' do
    let(:facts) {{ :kernel => 'foo' }}
    it do
      expect {
        should contain_class('prometheus::install')
      }.to raise_error(Puppet::Error, /unsupported/)
    end
  end
end
