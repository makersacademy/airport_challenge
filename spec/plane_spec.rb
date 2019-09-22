require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#took_off' do
    it "Plane is will be airborne after taking off" do
      plane.takes_off
      expect(plane).to be_airborne
    end
  end

  describe '#lands' do
    it "Plane is will no longer be airborne after landing" do
      plane.lands
      expect(plane).to_not be_airborne
    end
  end
end
