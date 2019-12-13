require 'airport'

describe Airport do
  it 'creating a new instance of airport' do
    airport = Airport.new
  expect(airport).to be_a Airport
  end

  it 'so an airport can be an airport method' do
    airport = Airport.new
  expect(airport).to respond_to :airport?
  end

  it 'making sure airport exists' do
   expect(Airport.new.airport?).to be true
  end

  it 'landing the plane at the airport' do
    airport = Airport.new
  expect(airport).to respond_to :runway.with(2).arguments
  end
end
