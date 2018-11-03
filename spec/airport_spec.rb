require 'airport'

describe Airport do

  let(:airport) { Airport.new }

  describe "initialize" do
    it 'creates an empty hangar when initialized' do
      expect(airport.hangar).to eq []
    end
  end

  describe '#plane_land' do
    it 'allows a plane to land at an airport' do
      plane = Plane.new
      airport.land_at_airport(plane)
      expect(airport.hangar).to eq [plane]
    end
  end

  describe '#plane_take_off' do
    it 'allows planes to take off from an airport' do
      plane = Plane.new
      airport.take_off_from_airport(plane)
      expect(airport.hangar).to eq []
    end
  end

  describe '#confirm_take_off' do
    it 'allows user to confirm a plane has taken off' do
      plane = Plane.new
      airport.land_at_airport(plane)
      airport.take_off_from_airport(plane)
      expect(airport.confirm_take_off(plane)).to eq "#{plane} has taken off!"
    end

    it 'allows user to see if a plane has not taken off' do
      plane = Plane.new
      airport.land_at_airport(plane)
      expect(airport.confirm_take_off(plane)).to eq "#{plane} has not taken off yet!"
    end
  end

end
