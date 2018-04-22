require 'airport'

describe Airport do

  subject(:airport) { Airport.new }
  DEFAULT_CAPACITY = 2
  let(:weather) { double :weather, stormy?: false }
  before { allow(Weather).to receive(:new).and_return(weather) }

  describe '#initialize' do

    it 'sets default capacity when none is specified' do
      expect(airport.capacity).to eq DEFAULT_CAPACITY
    end

    it 'overrides default capacity when specified' do
      airport.capacity = 3
      expect(airport.capacity).to eq 3
    end

  end

  describe '#plane_lands' do

    let(:plane) { double :plane, landed: false, land: true }

    it 'shows plane in airport once it lands' do
      airport.land(plane)
      expect(airport.planes.include? plane).to eq true
    end

    let(:plane_prevent_land) { double :plane, landed: false }
    let(:landed_plane) { double :plane, landed: true, take_off: false }

    it 'shows plane has not landed in airport due to bad weather conditions' do
      allow(weather).to receive(:stormy?) { true }
      expect { airport.land(plane_prevent_land)
      }.to raise_error "Can't land: Bad weather conditions!"
      expect(airport.planes.include? plane_prevent_land).to eq false
    end

    it 'shows plane has not landed in airport when airport is full' do
      airport.planes.concat [landed_plane, landed_plane]
      expect { airport.land(plane_prevent_land)
      }.to raise_error "Can't land: Airport is full!"
      expect(airport.planes.include? plane_prevent_land).to eq false
    end

    it 'raises an error when plane tries lands when it is already in airport' do
      airport.land(plane)
      expect { airport.land(plane)
      }.to raise_error "Plane is already landed in this airport!"
    end

  end

  describe '#plane_take_off' do

    let(:landed_plane) { double :plane, landed: true, take_off: false }

    it 'shows plane has left airport once it takes off in good weather' do
      airport.planes << landed_plane
      airport.take_off(landed_plane)
      expect(airport.planes.include? landed_plane).to eq false
    end

    let(:landed_plane_badweather) { double :plane, landed: true }

    it 'shows plane has not left airport due to bad weather conditions' do
      airport.planes << landed_plane_badweather
      allow(weather).to receive(:stormy?) { true }
      expect { airport.take_off(landed_plane_badweather)
      }.to raise_error "Can't take off: Bad weather conditions!"
      expect(airport.planes.include? landed_plane_badweather).to eq true
    end

    let(:another_landed_plane) { double :plane, landed: true, take_off: false }

    it 'raises error when plane takes off from airport it is not in' do
      airport.planes << landed_plane
      expect { airport.take_off(another_landed_plane)
      }.to raise_error "Plane is not landed in this airport!"
    end

  end

end
