require 'plane'
describe Plane do

  let (:plane) { Plane.new }

  it 'should let plane be instantiated' do
    expect(plane).to be_a Plane
  end
end
