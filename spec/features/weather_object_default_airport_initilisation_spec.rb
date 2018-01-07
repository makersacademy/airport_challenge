require 'airport'

describe 'Airport start up' do
  it 'defaults to Weather object if no argument is given on initialisation' do
    airport = Airport.new
    expect(airport.weather).to be_an_instance_of(Weather)
  end
  it 'does not default to Weather object if argument is given' do
    airport = Airport.new("Hello")
    expect(airport.weather).not_to be_a_instance_of(Weather)
  end
end
