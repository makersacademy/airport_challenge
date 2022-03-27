require 'plane'

describe Plane do
  it 'The plane should be in the air.' do
    expect(subject).to_not be_grounded
  end

  it 'The plane should be on the ground' do
    plane = Plane.new
    plane.grounded = true
    expect(plane).to be_grounded
  end
end
