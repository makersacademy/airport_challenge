require 'airport'
require 'plane'
require 'weather'

describe Airport do
  it 'instructs a plane to land' do
    expect(subject).to respond_to(:land)
  end

  it 'checks landed plane is in airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it 'instructs a plane to take-off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'checks taken-off plane has left airport' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include plane
  end

  it 'prevents take-off when stormy' do
    plane = Plane.new
    subject.land(plane)
    weather = Weather.new
    weather_check = weather.check
    if weather_check == 'stormy'
      expect(subject.take_off(plane, weather_check)).to eq("Planes grounded; stormy weather.")
    end
  end

  it 'prevents planes landing when stormy' do
    plane = Plane.new
    weather = Weather.new
    weather_check = weather.check
    if weather_check == 'stormy'
      expect(subject.land(plane, weather_check)).to eq("Unable to land; stormy weather.")
    end
  end

  it 'prevents landing if airport full' do
    plane = Plane.new
    capacity = 10
    capacity.times { subject.land(plane) }
    expect(subject.land(plane)).to eq("Unable to land; airport full.")
  end

  it 'allows change of defauly capacity' do
    plane = Plane.new
    airport = Airport.new(5)
    5.times { airport.land(plane) }
    expect(airport.land(plane)).to eq("Unable to land; airport full.")
  end
end
