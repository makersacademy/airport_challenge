require 'airport'

describe Airport do

it { is_expected.to respond_to(:plane) }

it 'lands planes' do
  plane = Plane.new
  expect(subject.land(plane)).to eq plane
end


end
