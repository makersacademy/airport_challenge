require './lib/plane'

describe Plane do
  it 'can create a plane' do
    expect(Plane.new).to be_a Plane
  end

end
