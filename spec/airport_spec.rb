require 'airport'
require 'plane'

describe Airport do
  context 'after a plane has landed and taken off' do
    it 'returns 0 when plane_count is called' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return false
      plane = Plane.new
      plane.land(airport)
      plane.take_off(airport)
      expect(airport.plane_count).to eq 0
    end

    it 'raises an error if a plane tries to take off from the airport' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return false
      expect { Plane.new.take_off(airport) }.to raise_error 'Airport empty'
    end
  end

  it 'returns "true" when stormy? is called if rand = 0.8' do
    airport = Airport.new
    allow(airport).to receive(:rand).and_return 0.8
    expect(airport).to be_stormy
  end

  it 'returns "false" when stormy? is called if rand = 0.4' do
    airport = Airport.new
    allow(airport).to receive(:rand).and_return 0.4
    expect(airport).not_to be_stormy
  end

  it 'allows up to 10 planes to land by default' do
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return false
    9.times { Plane.new.land(airport) } 
    expect { Plane.new.land(airport) }.not_to raise_error
  end

  context 'when capacity is overridden to 6' do
    it 'does not raise error when 6 planes are landed' do
      airport = Airport.new(6)
      allow(airport).to receive(:stormy?).and_return false
      5.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.not_to raise_error
    end

    it 'raises error when 7 planes are landed' do
      airport = Airport.new(6)
      allow(airport).to receive(:stormy?).and_return false
      6.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error 'Airport is full'
    end
  end
end
