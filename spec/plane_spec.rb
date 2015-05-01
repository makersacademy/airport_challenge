require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes off from the airport, the plane's status
# should become "flying"

describe Plane do

  let(:airport) {double :airport, receive: true, launch: true, planes: []}

  it 'has a flying status when created' do
    expect(subject.flying?).to be true
  end

  it 'has a flying status when in the air' do
    expect(subject.flying?).to be true
  end

  it 'can take off' do
    airport.receive subject
    airport.launch subject
    planes = airport.planes
    expect(planes.include? subject).to be false
  end

  it 'changes its status to flying after taking off' do
    subject = Plane.new
    airport.receive subject
    airport.launch subject
    expect(subject.flying?).to be true
  end

end
