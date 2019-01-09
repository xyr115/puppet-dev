require 'spec_helper'

describe 'node_exporter::install' do
  context 'for a Systemd based Linux OS' do
    let(:facts) {{ :operatingsystemmajrelease => '7' }}
      it do
        should contain_package('node_exporter').with({
          'ensure'   => 'installed',
          'provider' => 'yum',
        })
      end
    end

  # find another way to classify this init
  # context 'for remaining init based Linux OSes ' do
  #   let(:facts) {{ :operatingsystemmajrelease => '7' }}
  #     it do
  #       should contain_package('daemonize').with({
  #         'ensure'   => 'installed',
  #       })
  #       should contain_package('init_node_exporter').with({
  #         'ensure'   => 'installed',
  #         'provider' => 'yum',
  #         'require'  => 'Package[daemonize]',
  #       })
  #     end
  #   end

  # For anything else
  context 'for remaining init based Linux OSes ' do
    let(:facts) {{ :kernel => 'foo' }}
      it do
        expect {
          should contain_class('node_exporter::install')
        }.to raise_error(Puppet::Error, /unsupported/)
      end
    end
  end
