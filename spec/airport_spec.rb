require 'airport'
require 'plane'
require 'weather'

describe Airport, :focus => true do

  def weather_sunny
    weather = double(:weather)
    allow(weather).to receive(:sunny?).and_return(true)
    weather
  end

  def weather_stormy
    weather = double(:weather)
    allow(weather).to receive(:sunny?).and_return(false)
    weather
  end

  it "should allow a plane to land" do
    expect(Airport.new(weather_sunny).request_to_land(Plane.new)).to eq true
  end

  it 'should store the information about landed planes' do
    airport = Airport.new(weather_sunny)
    airport.request_to_land(Plane.new)
    expect(airport.planes.count).to eq 1
  end

  it "should allow a plane to take off" do
    plane = Plane.new
    airport = Airport.new(weather_sunny)
    plane.land(airport)
    expect(airport.request_take_off(plane)).to eq true
  end

  it 'should remove the information about a plane when it takes off' do
    plane = Plane.new
    airport = Airport.new(weather_sunny)
    plane.land(airport)
    airport.request_take_off(plane)
    expect(airport.planes.count).to eq 0
  end

  it 'should remove planes after taking off' do
    plane_one = Plane.new
    plane_two = Plane.new
    airport = Airport.new(weather_sunny)
    plane_one.land(airport)
    plane_two.land(airport)
    expect(airport.planes.count).to eq 2
    plane_one.take_off(airport)
    expect(airport.planes.count).to eq 1
  end

  it 'should prevent take off when it is stormy' do
    airport = Airport.new(weather_stormy)
    plane = Plane.new(airport)
    expect(airport.request_take_off(plane)).to eq false
  end

  it 'should prevent landing when it is stormy' do
    plane = Plane.new
    airport = Airport.new(weather_stormy)
    expect(airport.request_to_land(plane)).to eq false
  end

  it 'should prevent landing when airport is full' do
    airport = Airport.new(weather_sunny)
    10.times { Plane.new.land(airport) }
    plane = Plane.new
    expect(airport.request_to_land(plane)).to eq false
  end

end
