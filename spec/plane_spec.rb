require "plane"

=begin
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
=end

describe Plane do
  # it { is_expected.to respond_to(:take_off) }
  it "responds to land with a airport" do
    airport = Airport.new
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "responds to take_off" do
    expect(subject).to respond_to(:take_off)
  end
end
