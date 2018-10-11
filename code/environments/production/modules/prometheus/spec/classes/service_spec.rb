require 'spec_helper'

describe 'prometheus::service' do
  context 'for a Linux based operating system' do
    let(:facts) {{ :kernel => 'Linux' }}

    it do
      should contain_file('/etc/systemd/system/prometheus.service').with({
        'source'  => 'puppet:///modules/prometheus/prometheus.service'
        'require' => 'Package[prometheus]',
      })
    end

    it do
      should contain_service('prometheus').with({
        'ensure'  => 'running',
        'enable'  => true,
        'require' => 'Package[prometheus]',
      })
    end
  end
end
