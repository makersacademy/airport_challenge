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

  it 'is flying when created' do
  	expect(subject).to be_flying
  end

  it 'can land' do
    airport = double()
    allow(airport).to receive(:plane_in).with(subject)
  	expect(subject.land airport).not_to be @flying
  end

  it 'is landed after landing' do
    airport = double()
    allow(airport).to receive(:plane_in).with(subject).and_return(true) 
    subject.land airport
  	expect(subject).not_to be_flying
  end

  it 'keeps flying if can\'t land' do
    airport = double()
    allow(airport).to receive(:plane_in).and_return(false)
    Plane.new.land airport
    expect(Plane.new.land airport).to be true # is this a cheat
  end 

  it 'can take off' do
  	airport = double()
    allow(airport).to receive(:plane_out).and_return(true)
  	expect(subject.take_off airport).to be true # is this a cheat
  end

  it 'is flying after take off' do
    airport = double()
    allow(airport).to receive(:plane_out).and_return(true)
    subject.take_off airport
  	expect(subject).to be_flying
  end

end
