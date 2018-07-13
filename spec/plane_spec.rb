require 'plane.rb'

describe Plane do 
  it "plane.new creates a new plane" do
    expect(Plane.new).to be_instance_of Plane
  end 
end 
