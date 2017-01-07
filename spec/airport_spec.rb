require 'airport'

describe Airport do
  it "lands a plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end


  #it "allows a plane to take off" do
  #  airport = subject
  #  plane = Plane.new


  #end
end
