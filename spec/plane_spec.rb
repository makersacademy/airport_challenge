require_relative "../lib/plane"

describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it 'can land' do
    expect(plane).to respond_to(:land).with(1).argument
  end

  it 'can land at an airport' do
    allow(airport).to receive(:condition?) { true }
    expect(plane.land(airport)).to eq airport.receive_plane(self)
  end

  describe '#take_off' do
    it 'plane responds to take_off' do
      expect(plane).to respond_to(:take_off)
    end

    it 'tells the airport that the plane has been released' do
      allow(airport).to receive(:condition?) { true }
      expect(plane.take_off(airport)).to eq 'Plane has departed the airport'
    end
  end
end
