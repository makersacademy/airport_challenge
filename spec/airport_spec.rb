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

  it "there is a default capcity of 5 planes, when no capacity is given" do
    expect(subject.capacity).to eq (5)
  end

  it "there is a variable capacity of plane, when a capcity is given" do
    expect(AirPort.new(10).capacity).to eq (10)
  end
  
  it "will not accept a landing plane, if capacity has been reached" do
    5.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'No room at airport'
  end

  it "will raise an error if a landed plan tries to land" do
    plane = Plane.new
    plane.landed_plane
    expect { subject.land(plane) }.to raise_error 'This plane is has already landed'
  end

  it "will raise an error if a flying plane tries to take off" do
    plane = Plane.new
    expect { subject.take_off(plane) }.to raise_error 'This plane is not landed here'
  end

  it "will stop planes landing if weather is stormy" do
    plane = Plane.new
    allow(Weather.new).to receive(:condition) { 1 }
    expect(subject.land(plane)).to raise_error "Its too stormy to land"
  end

  it "will stop planes from taking off if weather is stormy" do
    plane = Plane.new
    allow(Weather.new).to receive(:condition) { 1 }
    subject.land(plane)
    expect (subject.take_off(plane)).to raise_error "Its too stormy to take-off"
  end

end
