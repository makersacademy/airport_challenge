require 'airport'
require 'plane'
require 'weather'

def organize_plane_to(from, to, airport, type)
  plane = from.last
  transitioned_plane = airport.__send__(type, plane, weather)
  return if transitioned_plane.nil?
  to << transitioned_plane
  from.delete(plane)
end

describe "let's create some air traffic, so I can visit Makers in person" do

  cologne_bonn = Airport.new(30)
  london_heathrow = Airport.new(30)
  flying_planes = Array.new(100) { Plane.new }
  cologne_planes = []
  london_planes = []

  land_cologne = [flying_planes, cologne_planes, cologne_bonn, :instruct_to_land]
  land_london = [flying_planes, london_planes, london_heathrow, :instruct_to_land]
  take_off_cologne = [cologne_planes, flying_planes, cologne_bonn, :instruct_to_take_off]
  take_off_london = [london_planes, flying_planes, london_heathrow, :instruct_to_take_off]

  it 'allows us to let several planes land/take off' do  

    srand(1234)
    25.times do 
      organize_plane_to(*land_cologne)
      organize_plane_to(*land_london)
    end
    100.times do
      organize_plane_to(*take_off_cologne)
      organize_plane_to(*take_off_london)
      organize_plane_to(*land_cologne)
      organize_plane_to(*land_london)
    end
    all_planes = [flying_planes, cologne_planes, london_planes]
    plane_distribution = all_planes.map! { |location| location.count }
    expect(plane_distribution).to eq([63, 15, 22])
  end
  
end
