require 'airport'

describe Airport do

it { is_expected.to respond_to(:plane) }

# it 'lands planes' do
#   plane = Plane.new
#   expect(subject.land(plane)).to eq plane
# end

it 'tells plane to land and puts in storage' do
  plane = Plane.new
  subject.land(plane)
  expect(subject.storage.size).to eq 1
end

it 'takes plane out of storage after take off' do
  plane = Plane.new
  subject.land(plane)
  subject.take_off(plane)
  expect(subject.storage.size).to eq 0
end


end
