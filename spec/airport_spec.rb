require 'airport'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe ' #land ' do
    it 'should instruct a plane to land at an airport' do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

  describe ' #takeoff ' do
    it 'should instruct a plane to take off from an airport' do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end
  end
end
