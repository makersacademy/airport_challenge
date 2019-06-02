require 'controller'

describe Controller do
  it 'can respond to a request to decide to land a plane' do
    expect(subject).to respond_to(:land_plane?)
  end

  it 'decides to allow plane to land if airport has capacity' do
    airport = Airport.new
    airport.capacity = 10
    airport.planes = 5
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    expect(subject.land_plane?(airport, weather)).to eql(true)
  end

  it 'decides not to allow plane to land if airport is full' do
    airport = Airport.new
    airport.capacity = 10
    airport.planes = 10
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    expect(subject.land_plane?(airport, weather)).to eql(false)
  end

  it 'decides not to allow plane to land if weather is stormy' do
    airport = Airport.new
    weather = double
    allow(weather).to receive_messages(:stormy? => true)
    expect(subject.land_plane?(airport, weather)).to eql(false)
  end

  it 'decides to allow plane to land if weather is not stormy' do
    airport = Airport.new
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    expect(subject.land_plane?(airport, weather)).to eql(true)
  end

  it 'decides not to allow plane to take off if weather is stormy' do
    weather = double
    allow(weather).to receive_messages(:stormy? => true)
    expect(subject.take_off?(weather)).to eql(false)
  end

  it 'decides to allow plane to take off if weather is not stormy' do
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    expect(subject.take_off?(weather)).to eql(true)
  end

  it 'should comfirm a plane has landed if request is successful' do
    plane = Plane.new
    airport = Airport.new
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    airport.capacity = 10
    airport.planes = 5
    result = subject.handle_landing_request(plane, airport, weather)
    expect(result).to eql(true)
  end

  it 'should comfirm a plane has not landed if request is not successful' do
    plane = Plane.new
    airport = Airport.new
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    airport.capacity = 10
    airport.planes = 10
    result = subject.handle_landing_request(plane, airport, weather)
    expect(result).to eql(false)
  end

  it 'should comfirm a plane has taken off if request is successful' do
    plane = Plane.new
    plane.at_airport = true
    airport = Airport.new
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    airport.capacity = 10
    airport.planes = 5
    result = subject.handle_take_off_request(plane, airport, weather)
    expect(result).to eql(true)
  end

  it 'should comfirm a plane has not taken off if request is not successful due to bad weather' do
    plane = Plane.new
    plane.at_airport = true
    airport = Airport.new
    weather = double
    allow(weather).to receive_messages(:stormy? => true)
    airport.capacity = 10
    airport.planes = 5
    result = subject.handle_take_off_request(plane, airport, weather)
    expect(result).to eql("Plane did not take off due to stormy weather.")
  end

  it 'should comfirm a plane has not taken off if request is not successful due to plane not being at airport' do
    plane = Plane.new
    plane.at_airport = false
    airport = Airport.new
    weather = double
    allow(weather).to receive_messages(:stormy? => false)
    airport.capacity = 10
    airport.planes = 5
    result = subject.handle_take_off_request(plane, airport, weather)
    expect(result).to eql("Plane did not take off due to not being at the airport.")
  end

end
