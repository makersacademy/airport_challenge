require 'plane'

describe Plane do

  it { is_expected.to respond_to :confirm_take_off }

  # describe "#confirm_take_off" do
  #   it "returns true if a plane is not landed at an airport" do
  #     airport = Airport.new
  #     airport.land(subject)
  #     expect(subject.confirm_take_off(airport)).to eq false
  #     airport.take_off
  #     expect(subject.confirm_take_off(airport)).to eq true
  #   end
  # end

end
