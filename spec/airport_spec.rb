require 'airport'

describe Airport do
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:check_weather) }
  
  it 'has a capacity attribute, set to 3 by default' do
    expect(airport.capacity).to eq(3)
  end

  it 'has capacity 2 when specified as parameter' do
    airport = Airport.new(2)
    expect(airport.capacity).to eq(2)
  end

  it "has an empty hangar at startup" do
    expect(airport.hangar).to eq []
  end

  describe '#land_plane(plane)' do
    context 'when plane in hangar' do
      it 'raises error that plane already in hangar' do
        airport.hangar << plane
        expect { airport.land_plane(plane) }.to raise_error("Plane already in hangar.")
      end
    end
    
    context 'when sunny' do
      it 'but full; raises an error when landing' do
        allow(airport).to receive(:check_weather) { 'sunny' }
        3.times { airport.land_plane(Plane.new) }
        expect { airport.land_plane(plane) }.to raise_error("Permission not granted. The airport is full.")
      end
      it 'returns a plane' do
        allow(airport).to receive(:check_weather) { 'sunny' }
        airport.land_plane(plane)
        expect(airport.hangar.include? plane).to be true
      end
  
      it 'puts the plane in hangar' do
        allow(airport).to receive(:check_weather) { 'sunny' }
        airport.land_plane(plane)
        expect(airport.hangar.include? plane).to be true
      end
    end
    
    context 'when stormy' do
      it 'does not allow landing' do
        allow(airport).to receive(:check_weather) { 'stormy' }
        expect { airport.land_plane(plane) }.to raise_error("Permission denied. Stormy weather")
      end
    end
  end
    
  describe '#take_off(plane)' do
    context 'when plane not in hangar' do
      it 'raises an error that plane not in hangar' do
        expect { airport.take_off(plane) }.to raise_error("Plane not in hangar.")
      end
    end
    
    context 'when sunny' do
      it 'returns a plane, after take off' do 
        allow(airport).to receive(:check_weather) { 'sunny' }
        airport.hangar << plane
        expect(airport.take_off(plane)).to eq plane
      end

      it 'removes plane from hangar after set-off' do
        allow(airport).to receive(:check_weather) { 'sunny' }
        airport.hangar << plane
        airport.take_off(plane)
        expect(airport.hangar.include? plane).to be false
      end
    end
    
    context 'when stormy' do
      it 'raises an error when taking_off' do
        airport.hangar << plane
        allow(airport).to receive(:check_weather) { 'stormy' }
        expect { airport.take_off(plane) }.to raise_error("Permission denied. Stormy weather")
      end
    end
  end

  describe '#check_weather' do
    it 'returns "sunny" or "stormy"' do
      expect(airport.check_weather).to eq("sunny").or eq("stormy")
    end

    it 'returns stormy when rand(5) is 4' do
      allow(airport).to receive(:rand) { 4 }
      expect(airport.check_weather).to eq("stormy")
    end

    it 'returns sunny when rand(5) is 0' do
      allow(airport).to receive(:rand) { 0 }
      expect(airport.check_weather).to eq("sunny")
    end

    it 'returns sunny when rand(5) is 3' do
      allow(airport).to receive(:rand) { 3 }
      expect(airport.check_weather).to eq("sunny")
    end
  end
end
