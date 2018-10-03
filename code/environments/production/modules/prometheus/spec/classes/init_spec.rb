require 'spec_helper'
describe 'prometheus' do
  context 'with default values for all parameters' do
    let(:facts) {{ :kernel => 'Linux' }}
    it { should contain_class('prometheus') }
  end
end
