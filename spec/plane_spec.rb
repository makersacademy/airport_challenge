require 'plane'

describe Plane do
  it 'instructs a plane to land' do
    expect(subject).to respond_to :land
  end
end
