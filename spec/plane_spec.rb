require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  describe '#land_at' do
    it "respond to instruct_to_land with 1 argument" do
      expect(plane).to respond_to(:land_at).with(1).argument
    end
  end

  describe '#take_off' do
    it "respond to take_off" do
      expect(plane).to respond_to(:take_off).with(1).argument
    end
  end

end
