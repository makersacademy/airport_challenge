require "plane"

describe Plane do
  describe 'plane status check' do

    it 'gets plane status - checks default = air when no airport given' do
      plane = Plane.new
      expect(plane.status?).to eq "air"
    end

    it 'gets plane status - checks default = land when airport given' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(plane.status?).to eq "land"
    end

    it 'checks if flying if not checked into an airport on creation' do
      plane = Plane.new
      expect(plane.flying?).to eq true
    end

    it 'checks if NOT flying if given a home airport' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(plane.flying?).to eq false
    end

    it 'checks that plane is in airport hangar when airport given' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(airport.in_hangar(plane)).to eq true
    end

    it 'checks that plane is NOT in airport hangar when no airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.in_hangar(plane)).to eq false
    end

    it 'checks if a plane is NOT in any airport' do
      # airport = Airport.new
      plane = Plane.new
      expect(plane.in_airport?).to be_empty
    end

    it 'checks that a new plane is in its home airport' do
      airport = Airport.new
      plane = Plane.new(airport)
      expect(plane.in_airport?[0]).to eq airport
    end

    it 'checks that a new plane is in only one airport after take off and land at another airport' do
      airport = Airport.new
      airport.update_weather("sunny")
      airport2 = Airport.new
      airport2.update_weather("sunny")
      plane = Plane.new(airport)
      airport.takeoff(plane)
      airport2.land(plane)
      expect(plane.in_airport?.count).to eq 1
    end

    it 'checks that a new plane is in final airport2 after take off from airport1 and land at airport2' do
      airport1 = Airport.new
      airport1.update_weather("sunny")
      airport2 = Airport.new
      airport2.update_weather("sunny")
      plane = Plane.new(airport1)
      airport1.takeoff(plane)
      airport2.land(plane)
      expect(plane.in_airport?[0]).to eq airport2
    end

  end

  describe 'plane update status' do
    it 'sets plane status - land to air' do
      plane = Plane.new
      expect(plane.update_status("air")).to eq "air"
    end
  end
end
