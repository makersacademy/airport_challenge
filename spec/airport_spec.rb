require 'airport'

describe Airport do

it { is_expected.to respond_to(:plane) }

# it 'lands planes' do
#   plane = Plane.new
#   expect(subject.land(plane)).to eq plane
# end

it 'tells plane to land' do
  plane = Plane.new
  subject.land(plane)
  expect(subject.storage.size).to eq 1
end




end
