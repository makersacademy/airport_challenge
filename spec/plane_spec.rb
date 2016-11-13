require 'airport'
require 'plane'
require 'weather'

RSpec.describe Plane do

it "should have a flight number that is a number" do
expect(subject.flight_number).to be_an_instance_of(Fixnum)
end
end
