require 'spec_helper'

describe 'ntp::config' do
  context 'for an ntp configuration file' do
    let(:facts) {{ :kernel => 'Linux'  }}
    it do
      expect {
        should contain_file('/etc/ntp.conf').with({
          'ensure' => 'file',
          'mode'   => '0644',
          'owner'  => 'root',
          'group'  => 'root',
          content => /server 0.pool.ntp.org iburst/,
        })
      }
    end
  end
end
