require 'spec_helper'

describe 'grafana' do

  describe "contains classes" do
    it { should contain_anchor('graphite::begin') }
    it { should contain_class('graphite::install') }
    it { should contain_class('graphite::config') }
    it { should contain_anchor('graphite::end') }
  end

end