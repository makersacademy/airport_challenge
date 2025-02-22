require './lib/airport.rb'
require './spec/plane_spec.rb'
RSpec

describe 'Airport can be initialised' do
  
  it 'class can be created' do
    airport = Airport.new
    expect(airport).not_to be_nil
  end

  it 'has default capacity' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times {airport.land Plane.new}
    expect{airport.land Plane.new}.to raise_error 'Airport full'
  end
end

describe '#land' do
  it 'plane can land at airport' do
      plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq [plane]
  end

  it 'plane rejected if full' do
    airport = Airport.new(5)
    5.times {airport.land Plane.new}
    expect{airport.land Plane.new}.to raise_error 'Airport full'
  end
end

describe '#take off' do
  it 'plane can take off' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.take_off(plane)
    expect(subject.instance_variable_get("@airport")).not_to eq plane
  end
  it 'confirms it is no longer at airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq "#{plane} has taken off"
  end
  it 'Will not take off id weather is stormy' do
    plane = Plane.new
    airport = Airport.new
    @weather = ("stormy")
    expect(airport.take_off(plane)).to raise_error 'poor weather, flight cancelled'
  end
end

describe 'Current weather is declared' do

  it 'checks current weather' do
    airport = Airport.new
    airport.check_weather
    expect(airport.instance_variable_get("@weather")).not_to be_nil
  end

end