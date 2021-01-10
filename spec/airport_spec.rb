require 'airport'

describe Airport do

it 'should allow a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
end

it 'lands something' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

it 'plane should takeoff' do
    expect(subject).to respond_to(:takenoff?)
end
it 'confirms takeoff to airport' do
    plane = subject.takenoff?
    expect(plane).to be_takeoffconfirmed
end


end
