require './lib/plane'

describe Plane do

  it 'can creates a plane' do
    expect(Plane.new).to be_a Plane
  end
end
