require 'airport'

describe AirPort do
  
  it "lands a plane in an airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "plane is in hanger after it lands" do
    plane = Plane.new

    expect(subject.land(plane)).to eq [plane]
  end

  it "once a plane has landed, we would like to tell a plane to take off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it "once a plane has taken off, check it is no longer in the hanger" do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.hanger). to eq []
  end

  it "checks that when a number of planes are in the hanger, the correct one takesoff" do
    2.times{subject.land(Plane.new)}
    vip_plane = Plane.new
    subject.land(vip_plane)
    2.times{subject.land(Plane.new)}
    expect(subject.take_off(vip_plane)).to eq vip_plane
  end

  it "there is a default capcity of 5 planes, when no capacity is given" do
    airport = AirPort.new
    expect(airport.capacity).to eq (5)
  end

  it "there is a variable capacity of plane, when a capcity is given" do
    airport = AirPort.new(10)
    expect(airport.capacity).to eq (10)
  end
  

end
