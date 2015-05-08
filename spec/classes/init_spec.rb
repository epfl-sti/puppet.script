require 'spec_helper'
describe 'script' do

  context 'with defaults for all parameters' do
    it { should contain_class('script') }
  end
end
