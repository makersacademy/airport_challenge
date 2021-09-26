require 'airport_class'
require 'plane_class'

RSpec.describe Airport do 
  it 'should land a plane at an airport' do
    airport = Airport.new(2)
    plane = Plane.new
    expect(airport.land(plane)).to eq [plane]
  end   
  it 'should instruct plane to take off
  and confirm if not in airport' do
    airport = Airport.new(2)
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq "Plane has taken off" 
  end  
  it 'prevent landing when the airport is full' do
    airport = Airport.new(2)
    plane = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    first_plane = airport.land(plane)
    second_plane = airport.land(plane2)
    third_plane = airport.land(plane3)
    expect(third_plane).to eq "Cannot land Airport is full"
  end 

  it 'overide default airport capacity when 
  appropriate' do
    airport = Airport.new(2)
  
    expect(airport.add_capacity).to eq 3
   end   



   

      
  
end      
    