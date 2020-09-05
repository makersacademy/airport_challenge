require "plane"

=begin
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
=end

describe Plane do
  # it { is_expected.to respond_to(:take_off) }
  it "responds to land with a airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  describe "#land" do
    it "raises error if plane is already landed at an airport" do
      subject.land(Airport.new)
      expect { subject.land Airport.new }.to raise_error "This plane is already landed"
    end
  end

  it "responds to take_off" do
    expect(subject).to respond_to(:take_off)
  end
end
