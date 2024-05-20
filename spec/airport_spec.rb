require 'airport'
require 'plane'

describe Airport do

  it 'will recognise a plane landing' do
    expected = (subject).respond_to?( :land_at_airport)
  end

  it 'will instruct a plane to land at an airport' do
    expect(subject.land_at_airport Plane.new).to match("Please land at the airport")
  end

  it 'instruct a plane to take off from a airport' do
    expect(subject.take_off Plane.new).to match("Please take off from this airport")
  end

  it 'confirms a plane is no longer in the airport after taking off' do
    subject.take_off Plane.new
    actual = subject.plane_left
    expect(actual).to eq true
  end 

  it 'prevents landing when the airport is full' do 
    subject.land_at_airport Plane.new
    expect{subject.land_at_airport Plane.new}.to raise_error('Airport full')
  end 

  it 'can have the capcaity overridden as appropriate' do
    airport = Airport.new(10)
    10.times {airport.land_at_airport Plane.new}
    expect{airport.land_at_airport Plane.new}.to raise_error('Airport full')
  end 

  it 'prevents landing when weather is stormy' do
    stormy_weather = "Stormy"
    subject.weather_check(stormy_weather)
    expect{subject.land_at_airport Plane.new}. to raise_error('Weather is too stormy to land')
  end

  it 'prevents take off when weather is stormy' do
    stormy_weather = "Stormy"
    subject.weather_check(stormy_weather)
    expect{subject.take_off Plane.new}. to raise_error("Weather is too stormy to take off")
  end 

end