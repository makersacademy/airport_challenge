require 'plane.rb'
require 'airport.rb'

describe Plane do

  it 'There should be planes' do
  end

  it 'Plane should respond to land' do
    expect(subject).to respond_to(:land)
  end

  it 'Planes should land at airports' do
    airport = Airport.new
    expect(subject.land(airport)).to eq('landing')
  end

end
