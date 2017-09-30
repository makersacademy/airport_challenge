require 'airport'
require 'weather'

describe Airport do

  it 'clears plane for take off' do
    expect(Airport.new).to respond_to :clear?
  end
  it 'creates a new weather instance' do
    expect(Airport.new.weather).to be_instance_of Weather
  end
  it 'returns the weather' do
    airport = Airport.new
    allow(airport.weather).to receive(:rand).with(0..9) {9}
    airport.weather.randomize
    expect(airport.weather.stormy).to be_truthy
  end

  # it 'checks the weather' do
  #   weather = Weather.new
  #   allow(weather).to receive(:rand).with(0..9) {9}
  #   weather.randomize
  #   expect(Airport.new.clear?).to be_truthy
  
end