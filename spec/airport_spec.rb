require 'airport'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) {double :plane}

  describe '#land' do
    context 'when not stormy' do
      before :each do
        allow(airport.weather).to receive(:stormy_weather?).and_return(false)
        allow(plane).to receive(:land_plane)

        it 'should tell the plane to land' do
          plane = double(:plane, airborne: true)
          expect(airport).to receive(:land)
          airport.land(plane)
        end

        it 'should have plane in the Airport' do
          plane = double(:plane, airborne: true)
          airport.land(plane)
          expect(airport.planes_in_airport).to include plane
        end

        it 'should raise error when trying to land a landed plane' do
          plane = double(:plane, airborne: false)
          message = "This plane is already landed."
          expect{ airport.land(plane) }.to raise_error message
        end

        context 'when full' do
          it 'should raise an error' do
            plane = double(:plane, airborne: true)
            airport.capacity.times {airport.land(plane)}
            message = "Sorry. Airport full. Go away."
            expect{airport.land(plane)}.to raise_error message
          end
        end
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy'
    before do
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)

      it 'should tell the airport to take off the plane' do
        plane = double(:plane, airborne: false)
        expect(airport).to receive(:take_off)
        airport.take_off(plane)
      end

      it 'should remove plane from Airport' do 
        plane = double(:plane, airborne: false)
        airport.planes_in_airport.push(plane)
        airport.take_off(plane)
        expect(airport.planes_in_airport).not_to include(plane)
      end

      it 'should raise an error when plane is not in airport' do
        plane = double(:plane, airborne: false)
        airport.planes_in_airport.delete(plane)
        message = "Plane is not in this airport"
        expect { airport.take_off(plane) }.to raise_error message
      end
    end
  end

  context 'when stormy' do
    before do
      allow(airport.weather).to receive(:stormy_weather?).and_return(true)
    end
    it 'should raise an error' do
      plane = double(:plane)
      message = "Bad weather today. Cannot take off."
      expect{ airport.take_off(plane) }.to raise_error message
    end

  end

  describe '#set_capacity' do

    it 'should change the capacity to a different number' do
      number = double(:number)
      airport.change_capacity(10)
      expect(airport.capacity).to eq 10
    end
  end

end
