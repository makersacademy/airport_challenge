require 'airport_land'

RSpec.describe AirportLand do

  it 'creates an hangar' do
    my_airport = AirportLand.new
    expect(my_airport.hangar).to eq([])
  end

  it 'lands a plane at the airport' do
    my_airport = AirportLand.new
    plane = Plane.new
    expect(my_airport).to receive(:rand).and_return(2)
    expect(my_airport.land_plane(plane)).to eq([plane])
  end

  it 'a plane takes off from the airport' do
    my_airport = AirportLand.new
    plane = Plane.new
    expect(my_airport).to receive(:rand).and_return(2)
    expect(my_airport.take_off_plane).to eq([])
  end

  it 'prevents landing in airport when full' do
    my_airport = AirportLand.new
    plane = Plane.new
    hangar = my_airport.hangar
    expect(my_airport).to receive(:rand).and_return(2)
    my_airport.land_plane(plane)
    expect(my_airport).to receive(:rand).and_return(2)
    my_airport.land_plane(plane)
    expect(my_airport).to receive(:rand).and_return(2)
    my_airport.land_plane(plane)
    expect(hangar).to eq([plane, plane])
  end

  it 'default capacity is 2' do
    my_airport = AirportLand.new
    expect(my_airport.capacity).to eq(2)
  end

  it 'custom capacity is 10' do
    my_airport = AirportLand.new(10)
    expect(my_airport.capacity).to eq(10)
  end

  it 'does not let a plane land in stormy weather' do
    my_airport = AirportLand.new
    plane = Plane.new
    hangar =  my_airport.hangar
    expect(my_airport).to receive(:rand).and_return(1)
    # expect(my_airport.land_plane(plane)).to eq(hangar)

  end

end
