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
      expect(subject.take_off).to eq(false)
      subject.destination = 'Test'
      subject.take_off
      expect(subject.location).to eq('in_air')
    end
  end

  it "- able to obtain a plane's 'registration'" do
    expect(subject).to respond_to(:registration)
    expect(subject.registration).to be_an_instance_of(String)
  end

  it "- able to set 'destination' for a plane" do
    expect(subject).to respond_to(:destination)

    subject.destination = 'Test'
    expect(subject.destination).to eq('Test')
  end
end

RSpec.describe Airport do
  it '- class returns a list of all airports' do
    expect(Airport).to respond_to(:list_all_airports)
  end

  describe ".list_all_airports" do
    it '- provides an array of 0 or more airports' do
      expect(Airport.list_all_airports).to be_an_instance_of(Array)
    end 
  end
end
