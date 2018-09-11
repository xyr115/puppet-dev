require 'spec_helper'
describe 'ntp' do
  context 'with default values for all parameters', :init => true do
    let(:facts) {{ :kernel => 'Linux' }}
    it { should contain_class('ntp') }
    it { should contain_class('ntp::install') }
  end
end
