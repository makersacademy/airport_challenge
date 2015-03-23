require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  it 'has a flying status when created' do
    plane = Plane.new
    expect(plane.status).to be(:flying)
  end

  it 'has a flying status when in the air' do
    plane = Plane.new
    expect(plane.take_off(airport)).to be(:flying)
  end

  it 'can take off' do
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end

  it 'can land' do
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end

  it 'has a landed status after landing' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:weather) { :good }
    expect(plane.land(airport)).to be(:landed)
  end

  it 'changes its status to flying after taking off' do
    plane = Plane.new
    airport = Airport.new('Heathrow')
    allow(airport).to receive(:weather) { :good }
    plane.land(airport)
    expect { plane.take_off(airport) }.to change { plane.status }.to(:flying)
  end

end
