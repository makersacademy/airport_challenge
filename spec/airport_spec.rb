require 'airport_class'
require 'plane_class'

RSpec.describe Airport do 
  it 'should land a plane at an airport' do
    airport = Airport.new(2)
    plane = Plane.new
    allow(airport).to receive(:rand).and_return(2)
    
    expect(airport.land(plane)).to eq [plane]
  end   
  it 'should instruct plane to take off
  and confirm if not in airport' do
    airport = Airport.new(2)
    plane = Plane.new
    allow(airport).to receive(:rand).and_return(2)
    airport.land(plane)
    expect(airport.take_off(plane)).to eq "Plane has taken off" 
  end  
  it 'prevent landing when the airport is full' do
    airport = Airport.new(2)
    plane = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    allow(airport).to receive(:rand).and_return(2)
    first_plane = airport.land(plane)
    second_plane = airport.land(plane2)
    third_plane = airport.land(plane3)
    expect(third_plane).to eq "Cannot land Airport is full"
  end 

  it 'to prevent landing when weather is stormy' do
    airport = Airport.new(1)
    plane = Plane.new
    allow(airport).to receive(:rand).and_return(1)

    expect(airport.land(plane)).to eq("Weather is stormy: do not land")
  end   

  it 'land when weather is not stormy' do
    airport = Airport.new(2)
    plane = Plane.new
    
    allow(airport).to receive(:rand).and_return(2)

    expect(airport.land(plane)).to eq([plane])
  end   

  it 'prevent takeoff when weather is stormy ' do
    airport = Airport.new(2)
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:rand).and_return(1)

    expect(airport.take_off(plane)).to eq("Weather is stormy: do not take off")
  end  
  it 'takeoff when weather is not stormy ' do
    airport = Airport.new(2)
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:rand).and_return(2)

    expect(airport.take_off(plane)).to eq("Plane has taken off")
  end    
  
end      
    