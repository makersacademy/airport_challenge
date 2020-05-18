require './lib/plane'

describe Plane do
  let(:plane) { Plane.new }
  it 'can return a new plane' do
    expect(plane).to be_instance_of(Plane)
  end
end
