require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }  

  describe '#land' do
    it { is_expected. to respond_to :land }

    it 'lands a plane' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land("plane1")
      expect(airport.planes).to include("plane1")
    end

    it 'raises an error when the airport is full' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error("The airport is full!")
    end

    it 'can not land a plane if it is already in the airport' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("This plane is already in the airport!")
    end

    it 'prevents landing when it is stormy' do 
      allow(airport).to receive(:weather) { "stormy" }
      expect { airport.land(plane) }.to raise_error("Bad weather, can not land")
    end
  end

  describe '#take_off' do
    it { is_expected. to respond_to :take_off }

    it 'takes off a plane' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land("plane1")
      airport.take_off("plane1")
      expect(airport.planes).not_to include("plane1")
    end

    it 'prevents from taking off a plane which is already flying' do
      allow(airport).to receive(:weather) { "sunny" }
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error("This plane is not in the airport!")
    end

    it 'prevents taking off when it is stormy' do
      allow(airport).to receive(:weather) { "stormy" }
      expect { airport.take_off(plane) }.to raise_error('Bad weather, can not to take off')
    end
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  describe '#weather' do
    it 'returns "sunny" or "stormy"' do
      expect(airport.weather).to eq("sunny").or eq("stormy")
    end
  end
end