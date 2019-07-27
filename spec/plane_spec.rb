require 'plane'
describe Plane do
  it {expect(Plane.new).to respond_to(:landing?)}
end