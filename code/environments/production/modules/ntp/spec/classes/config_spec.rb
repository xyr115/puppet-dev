require 'spec_helper'

describe 'ntp::config', :config => true do
  context 'for a Linux distribution' do
    let(:facts) {{ :kernel => 'linux' }}
    it do
      should contain_file('/etc/ntp.conf').with({
        'ensure'  => 'file',
        'mode'    => '0644',
        'owner'   => 'root',
        'group'   => 'root',
        'content' => /server 0.pool.ntp.org iburst\nserver 1.pool.ntp.org iburst\nserver 2.pool.ntp.org iburst/,
        'notify'  => 'Service[ntp]',
      })
    end
  end
end
