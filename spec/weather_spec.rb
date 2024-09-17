# stormy = no takeoff / sunny = take_off, needs to be randomized. rand? .sample? conditions array?
require './lib/weather.rb'

describe Weather do
  subject { Weather.new }
  let(:conditions_array) { [true, false, false, true, false, true, true] }

  it { is_expected.to be_an_instance_of(Weather) }

  describe "#stormy?" do
    it "should return an element of conditions_array" do
    end
  end
end
