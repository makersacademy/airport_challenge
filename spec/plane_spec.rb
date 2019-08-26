require 'plane'

#  As an air traffic controller
#  So I can get passengers to a destination
#  I want to instruct a plane to land at an airport
describe Plane do
  it "class Plane responds to Airport land method" do
    expect(subject).to respond_to(:land)
  end
end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
describe Plane do
  it "class Plane responds to Airport take_off method" do
    expect(subject).to respond_to(:take_off)
  end
end
