require 'plane'
require 'airport'
require 'weather'

describe Plane do

  before :each do
    @airport = Airport.new
    @plane = Plane.new
    @good_weather = allow(Weather).to receive(:stormy?) { false }
    @plane.land(@airport)
  end

  it 'can land at an airport' do
    expect(@airport.planes[0]).to eq(@plane)
  end

  it 'can take off from an airport' do
    @plane.takeoff
    expect(@airport.planes).to be_empty
  end

  it 'cannot land if it\'s already landed' do
    expect { @plane.land(@airport) }.to raise_error "This plane has already landed"
  end

  it 'cannot take off if it\'s already in the air' do
    @plane.takeoff
    expect { @plane.takeoff }.to raise_error "This plane is already in the air"
  end

end
