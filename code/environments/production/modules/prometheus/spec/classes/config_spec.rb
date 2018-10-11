require 'spec_helper'

describe 'prometheus::config' do
  context 'for a Linux distribution' do
    let(:facts) {{ :kernel => 'Linux' }}
    it do
      should contain_file('/etc/prometheus/prometheus.yaml').with({
        'source'  => 'puppet://modules/prometheus/prometheus.yaml'
        'notify'  => 'Service[prometheus]',
      })
    end
  end
end
