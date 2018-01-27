require 'plane'
require 'airport'

describe Plane do
  it 'responds to land_status' do
    expect(subject).to respond_to(:land_status)
  end

  it 'land_status turns true when lands' do
    airport = Airport.new
    expect(airport.land(subject.land_status)).to eq(true)
  end
end
