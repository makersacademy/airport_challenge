require 'airport'
require 'plane'

describe Airport do
  context 'when airport is empty' do
    it 'raises error if a plane tries to take off' do
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

  context 'with default capacity' do
    it 'does not raise error when 10 planes are landed' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return false
      9.times { Plane.new.land(airport) } 
      expect { Plane.new.land(airport) }.not_to raise_error
    end

    it 'raises error when 11 planes are landed' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return false
      10.times { Plane.new.land(airport) } 
      expect { Plane.new.land(airport) }.to raise_error 'Airport is full'
    end
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
