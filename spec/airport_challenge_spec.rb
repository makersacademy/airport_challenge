require 'airport_challenge'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) {Plane.new}

  it 'allows a plane to land' do
    expect(airport).to respond_to :land
  end

  it 'puts plane in airport' do
    expect(airport.land(plane)).to include plane
  end

  it 'instructs plane to takeoff' do
    expect(airport.takeoff(plane)).not_to include plane
  end

  it 'prevents landing when airport at capacity' do
    20.times { airport.land(plane) }
    expect(airport.land(plane)).to eq "Sorry, airport's full!"
  end

  # it 'prevents takeoff when weather is stormy' do
  #   airport.weather == 'stormy'
  #   expect(airport.takeoff(plane)).to eq "No takeoffs while weather is stormy"
  # end
  #
  # it 'prevents landing when weather is stormy' do
  #   airport.weather == 'stormy'
  #   expect(airport.land(plane)).to eq "No landings while weather is stormy"
  # end

end
