require 'plane'

describe Plane do # First test
  it 'Creates a plane' do
    expect(Plane.new).to be_a(Plane)
  end
end
