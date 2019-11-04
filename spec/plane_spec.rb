require 'plane'
describe Plane do
  it 'can create an instance of plane' do
    plane = Plane.new
    expect(plane).to be_kind_of(Plane)
  end
end
