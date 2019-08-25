require_relative "../lib/plane"

describe Plane do
  it 'can land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  # refactor the below
  it 'can land at an airport' do
    airport = Airport.new
    allow(airport).to receive(:condition?) { true }
    expect(subject.land(airport)).to eq airport.receive_plane(self)
  end

  describe '#take_off' do
    it 'plane responds to take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'tells the airport to release plane' do
      airport = Airport.new
      allow(airport).to receive(:condition?) { true }
      expect(subject.take_off(airport)).to eq airport.release_plane(self)
    end
  end
end
