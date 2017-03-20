require 'airport'
describe Airport do

  subject(:airport) { described_class.new }

  describe '#land' do

    it 'should tell the plane to land' do
      plane = double(:plane, airborne: true)
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:land_plane)
      expect(airport).to receive(:land)
      airport.land(plane)
    end

    it 'should have plane in the Airport' do
      plane = double(:plane, airborne: true)
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:land_plane)
      airport.land(plane)
      expect(airport.planes_in_airport).to include plane
    end

    context 'when stormy' do
      it 'should not allow landing when weather is stormy' do
        plane = double(:plane, airborne: true)
        allow(airport.weather).to receive(:stormy_weather?).and_return(true)
        allow(plane).to receive(:land_plane)
        message = "Bad weather today. Cannot land."
        expect{ airport.land(plane) }.to raise_error message
      end
    end

    context 'when full' do
      it 'should raise an error' do
        plane = double(:plane, airborne: true)
        allow(plane).to receive(:land_plane)
        allow(airport.weather).to receive(:stormy_weather?).and_return(false)
        airport.capacity.times {airport.land(plane)}
        message = "Sorry. Airport full. Go away."
        expect{airport.land(plane)}.to raise_error message
      end
    end


    it 'should raise error when trying to land a landed plane' do
      plane = double(:plane, airborne: false)
      allow(plane).to receive(:land_plane)
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      message = "This plane is already landed."
      expect{ airport.land(plane) }.to raise_error message
    end

  end

  describe '#take_off' do

    it 'should tell the airport to take off the plane' do
      plane = double(:plane, airborne: false)
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)
      expect(airport).to receive(:take_off)
      airport.take_off(plane)
    end

    it 'should remove plane from Airport' do
      plane = double(:plane, airborne: false)
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)
      airport.planes_in_airport.push(plane)
      airport.take_off(plane)
      expect(airport.planes_in_airport).not_to include(plane)
    end

    context 'when stormy' do
      it 'should raise an error' do
        plane = double(:plane)
        allow(airport.weather).to receive(:stormy_weather?).and_return(true)
        message = "Bad weather today. Cannot take off."
        expect{ airport.take_off(plane) }.to raise_error message
      end
    end

    it 'should raise an error when plane is not in airport' do
      plane = double(:plane, airborne: false)
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)
      airport.planes_in_airport.delete(plane)
      message = "Plane is not in this airport"
      expect { airport.take_off(plane) }.to raise_error message
    end
  end

  describe '#set_capacity' do

    it 'should change the capacity to a different number' do
      number = double(:number)
      airport.change_capacity(number)
      expect(airport.capacity).to eq number
    end
  end

end
