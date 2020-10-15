# this is a set of tests to run as a "Functional Test"
# testing the capabilities of the Air Traffic controller
require 'software_airport'

=begin
User story 1 -
As an Air Traffic Controller
So I can get passengers to a destination
I want to instruct a plane to land at an Airport
=end

# Test breakdown:
# ability for the controller to instruct plane to land
RSpec.describe Plane do
  it "- Controller to instruct with 'land'" do
    expect(subject).to respond_to(:land)
  end
end
