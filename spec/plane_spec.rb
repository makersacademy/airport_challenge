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

    # it 'gets plane status of manually located plane' do
    #   plane = Plane.new("air")
    #   expect(plane.status?).to eq "air"
    # end
  end

  describe 'plane update status' do

    it 'sets plane status - land to air' do
      plane = Plane.new
      expect(plane.update_status("air")).to eq "air"
    end
  end
end
