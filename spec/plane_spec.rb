require 'plane'

describe Plane do

  it { is_expected.to respond_to :confirm_take_off }

  describe "#confirm_take_off" do
    it "returns true if a plane is not landed at an airport" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.confirm_take_off(airport)).to eq false
      airport.take_off
      expect(subject.confirm_take_off(airport)).to eq true
    end
  end

  describe "#landed" do
    it "returns true if plane is landed, false if not" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.landed).to eq true
      airport.take_off
      expect(subject.landed).to eq false
    end
  end

end
