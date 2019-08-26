require 'plane'

#  As an air traffic controller
#  So I can get passengers to a destination
#  I want to instruct a plane to land at an airport
describe Plane do
  it "class Plane responds to Airport land method" do
    expect(subject).to respond_to(:land)
  end
end
