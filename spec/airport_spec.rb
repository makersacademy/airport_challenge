require 'airport'

describe Airport do

  it 'instructs a plane to land' do
    plane = Plane.new
    weather = double(Weather)
    weather.stub(:forecast).and_return("sunny")
    weather = Weather.new
    airport = Airport.new(weather)
    airport.land(plane)
    expect(airport.planes_in_airport[0]).to eq plane
  end

  it 'instructs plane to take off' do
    plane = Plane.new
    weather = double(Weather)
    weather.stub(:forecast).and_return("sunny")
    airport = Airport.new(weather)
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes_in_airport.empty?).to eq true
  end

  it 'reports that a plane has taken off' do
    plane = Plane.new
    weather = double(Weather)
    weather.stub(:forecast).and_return("sunny")
    airport = Airport.new(weather)
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.report(plane)).to eq true
  end

  it 'prevents takeoff in stormy weather' do
    plane = Plane.new
    weather = double(Weather)
    weather.stub(:forecast).and_return("sunny")
    airport = Airport.new(weather)
    airport.land(plane)
    weather.stub(:forecast).and_return("stormy")
    airport.take_off(plane)
    expect(airport.report(plane)).to eq false
  end

  it 'prevents landing in stormy weather' do
    plane = Plane.new
    weather = double(Weather)
    weather.stub(:forecast).and_return("stormy")
    airport = Airport.new(weather)
    airport.land(plane)
    expect(airport.report(plane)).to eq true
  end

  it 'prevents landing when the airport is full'do
    plane1 = Plane.new
    plane2 = Plane.new
    weather = double(Weather)
    weather.stub(:forecast).and_return("sunny")
    airport = Airport.new(weather, 1)
    airport.land(plane1)
    airport.land(plane2)
    expect(airport.report(plane2)).to eq true
  end

  it 'communicates to the plane' do
    plane1 = Plane.new("flying")
    weather = double(Weather)
    weather.stub(:forecast).and_return("sunny")
    airport = Airport.new(weather)
    plane1.set_request("land")
    airport.communicate(plane1)
    expect(airport.report(plane1)).to eq false
    plane1.set_request("take off")
    airport.communicate(plane1)
    expect(airport.report(plane1)).to eq true


  end

end
