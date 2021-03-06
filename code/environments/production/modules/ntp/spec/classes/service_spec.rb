require 'spec_helper'

describe 'ntp::service' do
  context 'for a Linux based operating system' do
    let(:facts) {{ :kernel => 'Linux' }}
    it do
      should contain_service('ntp').with({
        'ensure'  => 'running',
        'enable'  => true,
        'require' => 'Package[ntp]',
      })
    end
  end
end
