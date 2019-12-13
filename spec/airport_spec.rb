require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

describe Airport do
  it 'expects a class which creates instances' do
    expect(Airport.new).to be_a(Airport)
  end

  it 'can respond to message land_plane' do
    expect(Airport.new).to respond_to(:land_plane)
  end

  it 'allows plane to take off in response to take_off' do
    air = Airport.new
    plane = Plane.new
    air.land_plane(plane)
    expect(air.take_off(plane)).to be_a(Plane)
  end

  it 'can confirm if plane is no longer in the airport' do
    air = Airport.new
    plane = Plane.new
    air.land_plane(plane)
    air.take_off(plane)
    expect(air.plane_check(plane)).to eq(false)
  end

  it 'prevents landing when airport is full' do
    air = Airport.new(5)
    5.times { air.land_plane(Plane.new) }
    expect{ air.land_plane(Plane.new) }.to raise_error("Hangar Full")
  end

  it 'allows capacity to be specified' do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  #it 'checks weather before allowing planes to land or take off' do
  #  air = Airport.new
  #  plane = Plane.new
  #  air.land_plane(plane)
  #  expect(air).to receive(:stormy?)
  #end

  it 'prevents takeoff when weather is stormy' do
    air = Airport.new
    plane = Plane.new

    allows airport to receive stormy .to raise_error("Stormy weather, no takeoff!")
  end

  #it 'prevents landing when weather is story' do 
  #  air = Airport.new
  #  plane = Plane.new
#
  #  allows airport to receive stormy .to raise_error("Storm weather, no landing!")
  #end

  
end
