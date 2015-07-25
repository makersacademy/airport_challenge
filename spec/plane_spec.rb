require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do

#  xit 'is flying when created'
  it 'is expected to be flying when created' do
    plane = Plane.new
    expect(plane).to respond_to :flying?
  end

#  xit 'can land'
  it 'can land' do
    expect(subject).to respond_to :land
  end

#  xit 'is landed after landing'
  it 'is landed after landing' do
    plane = Plane.new
    expect(plane).to respond_to :landed?
  #  expect(plane.landed).to eq false
  end
  
  it 'cannot be flying and landed' do
    plane = Plane.new
    plane.land
    expect(plane.landed?).to eq true
  end

#  xit 'can take off'
  it 'can take off' do
    expect(subject).to respond_to :take_off
  end
    
#  xit 'is flying after take off'
  it 'is flying after take off' do
    plane = Plane.new
    plane.take_off
    expect(plane.landed?).to eq false
    expect(plane.flying?).to eq true
  end
end
