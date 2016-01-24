require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  describe '#to_land_at' do
    it "respond to to_land_at with 1 argument" do
      expect(plane).to respond_to(:to_land_at).with(1).argument
    end
  end

  describe '#take_off' do
    it "respond to take_off" do
      expect(plane).to respond_to(:take_off).with(1).argument
    end
  end

end
