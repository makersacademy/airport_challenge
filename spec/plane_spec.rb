require 'plane'

describe Plane do
  it "should be an instance of 'Plane'" do
    plane = Plane.new(2)
    expect(plane).to be_an_instance_of(Plane)
  end

  it "should raise an error for incorrect plane number argument when instantiated" do
    expect { Plane.new("Not a number!") }.to raise_error "Plane number not given!"
  end
end
