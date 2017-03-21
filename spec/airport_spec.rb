require 'airport'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) {double :plane}

  describe '#land' do
    context 'when not stormy' do
      context 'when plane is airborne' do
        before :each do
          allow(plane).to receive(:airborne).and_return(true)
          allow(plane).to receive(:land_plane)
          allow(airport.weather).to receive(:stormy_weather?).and_return(false)
        end

        it 'should tell the plane to land' do
          expect(airport).to receive(:land)
          airport.land(plane)
        end

        it 'should have plane in the Airport' do
          airport.land(plane)
          expect(airport.planes_in_airport).to include plane
        end
        context 'when airport is full' do
          it 'should raise an error' do
            airport.capacity.times {airport.land(plane)}
            message = "Sorry. Airport full. Go away."
            expect{airport.land(plane)}.to raise_error message
          end
      end
      end
      context 'when plane is not airborne' do
        before :each do
          allow(plane).to receive(:airborne).and_return(false)
          allow(airport.weather).to receive(:stormy_weather?).and_return(false)
          allow(plane).to receive(:land_plane)
        end

        it 'should raise error when trying to land a landed plane' do
          message = "This plane is already landed."
          expect{ airport.land(plane) }.to raise_error message
        end
      end
    end

  end

  describe '#take_off' do
    before do
      allow(plane).to receive(:airborne).and_return(false)
      allow(airport.weather).to receive(:stormy_weather?).and_return(false)
      allow(plane).to receive(:take_off_plane)
    end
    it 'should tell the airport to take off the plane' do
      expect(airport).to receive(:take_off)
      airport.take_off(plane)
    end

    it 'should remove plane from Airport' do
      airport.planes_in_airport.push(plane)
      airport.take_off(plane)
      expect(airport.planes_in_airport).not_to include(plane)
    end

    it 'should raise an error when plane is not in airport' do
      airport.planes_in_airport.delete(plane)
      message = "Plane is not in this airport"
      expect { airport.take_off(plane) }.to raise_error message
    end

  end

  context 'when stormy' do
    before do
      allow(airport.weather).to receive(:stormy_weather?).and_return(true)
    end
    it 'should raise an error' do
      message = "Bad weather today. Cannot take off."
      expect{ airport.take_off(plane) }.to raise_error message
    end

  end

  describe '#set_capacity' do

    it 'should change the capacity to a different number' do
      airport.change_capacity(10)
      expect(airport.capacity).to eq 10
    end
  end

end
