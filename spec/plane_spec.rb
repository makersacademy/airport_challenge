require './lib/plane'

describe Plane do

  it 'can create a plane' do
    expect(Plane.new).to be_a Plane
  end

  it 'can land a plane' do
    expect(Plane.new).to respond_to(:land)
  end
end
