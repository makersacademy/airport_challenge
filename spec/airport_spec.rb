require 'airport'

describe Airport do

  it 'creates an airport' do #First test
    expect(Airport.new).to be_a(Airport)
  end

  it 'has a function to land a plane at the airport' do # Second test, added the with the with 1 argument later on (after test number 6 to allow a number to be passed through for capacity)
    expect(Airport.new).to respond_to(:land).with(1).argument
  end

  it 'has a function to take off' do # Third test
    expect(Airport.new).to respond_to(:take_off)
  end

  it 'confirms the plane has left the airport' do # Fourth test
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weather?) { false } # Refactored to include this
    airport.land(plane)
    expect(airport.take_off).to eq plane
  end

  it 'stops a plane landing if the airport is full using the default capacity' do # Fifth test, added the 'default capacity' part after adding in the next test
    airport = Airport.new
    allow(airport).to receive(:weather?) { false } # Refactored to include this
    10.times {airport.land(Plane.new)}
    plane = Plane.new
    expect{airport.land(plane)}.to raise_error 'No space to land the plane'
  end

  it 'stops a plane landing if the airport is full using the a given capacity' do # Sixth test,
    airport = Airport.new(20)
    allow(airport).to receive(:weather?) { false } # Refactored to include this
    20.times {airport.land(Plane.new)}
    plane = Plane.new
    expect{airport.land(plane)}.to raise_error 'No space to land the plane'
  end

  it 'does not allow a plane to take off in bad weather' do # Seventh test
    airport = Airport.new
    allow(airport).to receive(:weather?) { false } # Refactored to include this
    airport.land(Plane.new)
    allow(airport).to receive(:weather?) { true } # Refactored to include this
    expect{airport.take_off}.to raise_error 'You can not take off in a storm'
  end

  it 'does not allow a plane to land in bad weather' do # Eigth test
    airport = Airport.new
    allow(airport).to receive(:weather?) { true }
    expect{airport.land(Plane.new)}.to raise_error 'You can not land in a storm'
  end

  it 'does not allow a plane to take off if there are no planes' do # Ninth test
    airport = Airport.new
    expect{airport.take_off}.to raise_error 'There are no planes available'
  end

end
