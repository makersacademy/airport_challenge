require 'airport'

describe Airport do

  it 'airport gives plane permission to land' do
    my_plane = Plane.new
    my_array = []
    expect(Airport.new.land(my_plane)).to eq (my_array << my_plane)
  end

  it 'airport gives plane permission to takeoff' do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.land(my_plane)
    expect(my_airport.takeoff(my_plane)).to eq true
  end

  it 'plane requests landing and controller returns full' do
    my_airport = Airport.new
    3.times {my_airport.land(Plane.new)}
    expect {my_airport.land(Plane.new)}.to raise_error 'the airport is full'
  end

  it 'airport wont allow plane to takeoff it is isnt at the specific airport' do
    my_airport = Airport.new
    my_airport1 = Airport.new
    my_plane = Plane.new

    my_airport.land(my_plane)
    expect { my_airport1.takeoff(my_plane) }.to raise_error 'Plane not at this airport'

  end

  it 'there is a default airport capacity of 30 planes' do
    my_airport= Airport.new(30)
    expect(my_airport.capacity).to eq 30
  end

  it 'removes airport id when taking off' do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.land(my_plane)
    my_airport.takeoff(my_plane)

    expect(my_plane.airport).to be nil

  end

  it 'on takeoff change flying status to true' do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.land(my_plane)
    my_airport.takeoff(my_plane)

    expect(my_plane.flying).to eq true
  end

  it 'when landing change flying? to false' do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.land(my_plane)
    my_airport.takeoff(my_plane)
    my_airport.land(my_plane)

    expect(my_plane.flying).to eq false
  end

  it 'checks flying? status is false before airport allows takeoff' do
    my_plane = Plane.new
    my_airport = Airport.new
    my_airport.land(my_plane)
    my_plane.flying?(true)

    expect{my_airport.takeoff(my_plane)}.to raise_error 'Plane is already flying'

  end
  it 'checks when a plane takes off it is removed from the airport list' do
    my_airport = Airport.new
    my_plane = Plane.new

    my_airport.land(my_plane)
    my_airport.takeoff(my_plane)

    expect(my_airport.planes).to eq []


  end


end
