require 'spec_helper'

describe 'ntp::service', :service => true do
  context 'for a Linux based operating system' do
    let(:facts) {{ :kernel => 'Linux' }}
    it do
      should contain_service('ntp').with({
        'ensure' => 'running',
        'enable' => true,
      })
    end
  end
end
