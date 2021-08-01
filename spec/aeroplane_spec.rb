require 'aeroplane'

describe Aeroplane do

  it "lands plane when instructed" do
    plane = Aeroplane.new
    expect(plane.land).to eq "Plane has landed!"
  end

  it "the plane takes off when instructed" do
    plane = Aeroplane.new
    expect(plane.takeoff).to eq "Plane has taken off!"
  end  


end
