require 'airport'
require 'plane'

describe Airport do
  it 'plane can land at airport' do
    airport = Airport.new
    expect(airport).to respond_to :land_plane
  end

  it 'plane can leave the airport' do
    airport = Airport.new
    expect(airport).to respond_to :takeoff_plane
  end

  it 'airport is full' do
    airport = Airport.new
    expect(airport).to respond_to :full?
  end

  it 'Weather report' do
    airport = Airport.new
    expect(airport).to respond_to :weather
  end

end
