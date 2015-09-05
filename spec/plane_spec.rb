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
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?
# Are you testing that?
describe Plane do

  it 'is flying when created' do
    plane = Plane.new
    expect(plane).to be_flying
 end

 describe '#land' do
 it 'airport can_land plane' do
   plane = Plane.new
   expect(plane).to respond_to :can_land
 end

 it 'can land' do
   subject.can_land
   subject.landed?
   expect {subject.can_land}.to raise_error 'the plane cannot land if it is not flying'
 end

 it 'is landed after landing' do
    subject.can_land
    subject.landed?
    expect(subject).to be_landed
  end

 end

 describe '#take_off'

 it 'can take off' do
   plane = Plane.new
   expect{plane.can_take_off}.to raise_error 'cant take off when already flying'
  end

  it 'is flying after take off' do
    plane = Plane.new
    expect(plane).to be_flying
  end
end
