require 'airport'

describe Airport do

  let(:airport)         { described_class.new }
  let(:second_airport)  { described_class.new }
  let(:plane)           { double :plane, :in_flight => true }

  describe "#initialize" do
    it 'creates an empty hangar when initialized' do
      expect(airport.hangar).to eq []
    end

    it 'creates a weather system when initialized' do
      expect(airport.weather).to be_a_kind_of WeatherSystem
    end

    it 'it has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows a user to set a capacity' do
      allow(airport).to receive(:capacity).and_return(10)
      expect(airport.capacity).to eq 10
    end
  end

  describe '#land' do
    context 'whilst no storm is present' do

      before do
        allow(airport).to receive(:weather_check).and_return('Sunshine')

        it 'allows a plane to land at an airport' do
          allow(plane).to receive(:ground_plane).and_return(plane)
          airport.land(plane)
          expect(airport.hangar).to eq [plane]
        end

        it 'raises an error if a plane that has landed attempts to land' do
          allow(plane).to receive(:ground_plane).and_return(plane)
          airport.land(plane)
          message = 'Plane has already landed!'
          expect { airport.land(plane) }.to raise_error message
        end

        it 'raises an error when a plane that has already landed at another airport is asked to land' do
          allow(second_airport).to receive(:weather_check).and_return('Sunshine')
          allow(plane).to receive(:ground_plane).and_return(plane)
          airport.land(plane)
          allow(plane).to receive(:in_flight).and_return(false)
          message = 'Plane has already at another airport!'
          expect { second_airport.land(plane) }.to raise_error message
        end

        it 'raises an error when attempting to land a plane when the airport is full having set a default capacity' do
          Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
          message = 'Unable to land when airport full!'
          expect { airport.land(plane) }.to raise_error message
        end

        it 'raises an error when atempting to land a plane when the airport is full having set a custom capacity' do
          custom_airport = Airport.new(3)
          allow(custom_airport).to receive(:weather_check).and_return('Sunshine')
          3.times { custom_airport.land(plane) }
          message = 'Unable to land when airport full!'
          expect { custom_airport.land(plane) }.to raise_error message
        end
      end
    end

    context 'during a storm' do
      before do
        allow(airport).to receive(:weather_check).and_return('Stormy')
        it 'raises an error when a plane tries to land during a storm' do
          expect { airport.land(plane) }.to raise_error 'Plane cannot land during storm!'
        end
      end
    end
  end

  describe '#plane_take_off' do
    context 'when no storm is present' do

      before do
        allow(airport).to receive(:weather_check).and_return('Sunshine')

        it 'allows planes to take off from an airport' do
          airport.land(plane)
          airport.take_off(plane)
          expect(airport.hangar).to be_empty
        end

        it 'raises an error when the requested plane to take off is not at the airport' do
          expect { airport.take_off(plane) }.to raise_error 'That plane is not at the airport!'
        end
      end
    end

    context 'during a storm' do

      it 'raises an error when a plane attempts to take off during a storm' do
        allow(airport).to receive(:weather_check).and_return('Sunshine')
        allow(plane).to receive(:ground_plane).and_return(plane)
        airport.land(plane)
        allow(airport).to receive(:weather_check).and_return('Stormy')
        expect { airport.take_off(plane) }.to raise_error 'Plane cannot take off during storm!'
      end

    end
  end

  describe '#confirm_take_off' do

    before do
      allow(airport).to receive(:weather_check).and_return('Sunshine')

      it 'allows user to confirm a plane has taken off' do
        allow(plane).to receive(:ground_plane).and_return(plane)
        airport.land(plane)
        allow(plane).to receive(:in_flight).and_return(false)
        allow(plane).to receive(:unground_plane).and_return(plane)
        airport.take_off(plane)
        allow(plane).to receive(:in_flight).and_return(true)
        expect(airport.confirm_take_off(plane)).to eq "Confirmed: #{plane} has taken off!"
      end

      it 'raises an error if the plane has not taken off' do
        allow(plane).to receive(:ground_plane).and_return(plane)
        airport.land(plane)
        expect { airport.confirm_take_off(plane) }.to raise_error "#{plane} has not taken off!"
      end
    end
  end

end
