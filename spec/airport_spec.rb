require 'airport'

describe Airport do

subject(:airport) {described_class.new(20)}

it 'should allow a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
end

it 'does not allow to land when at full capacity' do
plane = double :plane
20.times do
    airport.land(plane)
end
expect {airport.land(plane)}.to raise_error 'airport full'
end

it 'plane should takeoff' do
    expect(subject).to respond_to(:takenoff?)
end

it 'confirms takeoff to airport' do
    plane = subject.takenoff?
    expect(plane).to be_takeoffconfirmed
end


end
