require 'airport'

describe Airport do

  let (:airport) {Airport.new(5)}
  let (:plane) {Plane.new}

  describe '#land_plane' do
    it 'lands plane when there is space' do
      expect(airport.land_plane(plane)).to eq "#{plane} landed"
    end
    it "raises 'no space' error when airport is full" do
      (airport.airport_capacity).times {airport.land_plane(plane)}
      expect {airport.land_plane(plane)}.to raise_error("no space")
    end
  end

  describe '#take_off' do
    it 'allows take off if plane is landed at airport' do
    end
    it 'raises error if plane is not landed at airport' do
    end
    it 'doesnt show the plane in @landed_planes after plane has taken off' do
    end 
  end


end