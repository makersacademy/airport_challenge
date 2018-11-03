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

    it 'raises an error if a plane that has landed attempts to land' do
      plane = Plane.new
      airport.land_at_airport(plane)
      expect{airport.land_at_airport(plane)}.to raise_error 'That plane has already landed!'
    end
  end

  describe '#plane_take_off' do
    it 'allows planes to take off from an airport' do
      plane = Plane.new
      airport.land_at_airport(plane)
      airport.take_off_from_airport(plane)
      expect(airport.hangar).to be_empty
    end
  end

  describe '#confirm_take_off' do
    it 'raises an error when there are no planes left at the airport' do
      plane = Plane.new
      expect{airport.take_off_from_airport(plane)}.to raise_error "There are no planes left at this airport!"
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
