require 'weather'

class DummyClass
  include Weather
end

describe DummyClass do

  it { is_expected.to respond_to :stormy? }

  #  describe 'stormy?' do
  #    it { [true,false].should include stormy? }
  #  end

  # undefined method `stormy?'
  # for #<RSpec::ExampleGroups::DummyClass::Stormy:0x007fb4ad4def40>

end
