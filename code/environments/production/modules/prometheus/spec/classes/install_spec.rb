require 'spec_helper'

describe 'prometheus::install' do
  context 'for a Linux based operating system' do
    let(:facts) {{ :kernel => 'Linux' }}
    it do
      should contain_file('prometheus-2.3.2-1.el7.x86_64.rpm').with({
        'source' =>  'puppet:///modules/prometheus/prometheus-2.3.2-1.el7.x86_64.rpm',
      })
    end

    it do
      should contain_package('prometheus-2.3.2-1.el7.x86_64.rpm').with({
        'ensure' => 'installed',
        'provider' => 'rpm',
        'source'   =>  '/tmp/prometheus-2.3.2-1.el7.x86_64.rpm',
        'require' => 'File["/tmp/prometheus-2.3.2-1.el7.x86_64.rpm"]',
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
