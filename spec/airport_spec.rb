require 'airport'

describe Airport do

  let(:airport) { Airport.new }

  describe "#initialize" do
    it 'creates an empty hangar when initialized' do
      expect(airport.hangar).to eq []
    end

    it 'creates a weather system when initialized' do
      expect(airport.weather).to be_an_instance_of WeatherSystem
    end
  end

  describe '#land_at_airport' do
    it 'allows a plane to land at an airport' do
      plane = Plane.new
      airport.land_at_airport(plane)
      expect(airport.hangar).to eq [plane]
    end

    it 'raises an error if a plane that has landed attempts to land' do
      plane = Plane.new
      airport.land_at_airport(plane)
      expect { airport.land_at_airport(plane) }.to raise_error 'That plane has already landed!'
    end
  end

  describe '#plane_take_off' do
    it 'allows planes to take off from an airport' do
      plane = Plane.new
      airport.land_at_airport(plane)
      airport.take_off_from_airport(plane)
      expect(airport.hangar).to be_empty
    end

    it 'raises an error when there are no planes left at the airport' do
      plane = Plane.new
      expect { airport.take_off_from_airport(plane) }.to raise_error "There are no planes left at this airport!"
    end

    it 'raises an error when the requested plane to take off is not at the airport' do
      plane = Plane.new
      plane2 = Plane.new
      airport.land_at_airport(plane)
      expect { airport.take_off_from_airport(plane2) }.to raise_error 'That plane is not at the airport!'
    end
  end

  describe '#confirm_take_off' do
    it 'allows user to confirm a plane has taken off' do
      plane = Plane.new
      airport.land_at_airport(plane)
      airport.take_off_from_airport(plane)
      expect(airport.confirm_take_off(plane)).to eq "Confirmed: #{plane} has taken off!"
    end

    it 'raises an error if the plane has not taken off' do
      plane = Plane.new
      airport.land_at_airport(plane)
      expect { airport.confirm_take_off(plane) }.to raise_error "#{plane} has not taken off!"
    end
  end

  describe '#weather_check' do
    it 'allows user to check the weather' do
      expect(airport.weather_check).to eq 'Sunshine'.to eq 'Fine'.to eq 'Overcast'.to eq 'Stormy'
    end
  end

end
