require "plane"

=begin
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
=end

describe Plane do

  # land

  it "responds to land with a airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  describe "#land" do
    it "raises error if plane is already landed at an airport" do
      airport = Airport.new(5)
      subject.land(airport)
      expect { subject.land airport }.to raise_error "This plane is already landed"
    end
  end

  # take_off

  it "responds to take_off" do
    expect(subject).to respond_to(:take_off)
  end

  describe "#take_off" do
    it "Confirms a plane has left the airport" do
      airport = Airport.new(1)
      subject.land(airport)
      expect { subject.take_off }.to output("The plane has departed\n").to_stdout
    end

    it "raises an error if the plane is not at an airport" do
      expect { subject.take_off }.to raise_error "This plane is already in the air"
    end
  end
end
