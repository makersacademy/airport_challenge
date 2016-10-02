require 'plane'

describe Plane do
  it 'instructs a plane to land' do
    expect(plane).to respond_to :land
  end
end
