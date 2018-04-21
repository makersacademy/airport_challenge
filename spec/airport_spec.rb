require 'airport'
require 'weather'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'should have a holding area for the planes' do
    expect(airport.holding.length).to eq 0
  end

  describe ' #land ' do
    it 'should instruct a plane to land at an airport' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'should prevent landing when weather is stormy' do
      expect_any_instance_of(Weather).to receive(:generate).and_return('stormy')
      expect { airport.land(plane) }.to raise_error(RuntimeError, "Unable to land due to weather conditions")
    end

  end

  describe ' #takeoff ' do
    it 'should instruct a plane to take off from an airport' do
      expect(airport).to respond_to(:takeoff).with(1).argument
    end

    it 'should return which plane is no longer in the airport' do
      expect_any_instance_of(Weather).to receive(:generate).and_return('sunny')
      expect(airport.takeoff(plane)).to eq("The #{plane} is no longer in the Airport")
    end

    it 'should prevent takeoff when weather is stormy' do
      expect_any_instance_of(Weather).to receive(:generate).and_return('stormy')
      expect { airport.takeoff(plane) }.to raise_error(RuntimeError, "Unable to take off due to weather conditions")
    end
  end

  describe '#capacity' do
    it 'should have a default capacity of 30 planes' do
      expect(airport.capacity).to eq(30)
    end
  end
end
