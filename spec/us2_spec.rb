# this is a set of tests to run as a "Functional Test"
# testing the capabilities of the Air Traffic controller
require 'software_airport'

=begin
User story 2 -
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
=end

# testing the ability to instruct a plane to take_off
RSpec.describe Plane do
  it "- responds to instruction to 'take_off'" do
    expect(subject).to respond_to(:take_off)
  end

  describe ".take_off" do
    it "- changes the status of the plane to 'in_air'" do
      subject.take_off
      expect(subject.status).to eq('in_air')
    end
  end

  it "- able to obtain a list of planes with identifiers 'registration'" do
    expect(subject).to respond_to(:registration)
  end

  it "- able to set 'destination' for a plane" do
    expect(subject).to respond_to(:destination)

    subject.destination = 'Test'
    expect(subject.destination).to eq('Test')
  end
end
