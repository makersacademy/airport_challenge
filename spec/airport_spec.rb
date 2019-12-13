require 'airport'

describe Airport do
  it 'creating a new instance of airport' do
  expect subject.to be_a Airport
  end
end

describe Airport do
  it 'landing the plane at the airport' do
  expect subject.to respond_to :land_plane
  end
end
