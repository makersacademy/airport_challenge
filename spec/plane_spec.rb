require 'plane'

describe Plane do
  describe "#land" do
    it "it expects plane to respond to land" do
      expect(subject).to respond_to :land
    end
    it "lands a plane at the airport" do
      airport = Airport.new
      expect(subject.land(airport)). to eq(airport)
    end
  end

  describe '#take_off' do
    it "expects plane to respond to take off" do
      expect(subject).to respond_to :take_off
    end
    it "expects a plane to take off from the airport" do
      airport = Airport.new
      expect(subject.take_off(airport)).to eq(airport)
    end
  end
end
