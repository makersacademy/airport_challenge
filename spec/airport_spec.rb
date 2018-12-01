require "airport"

describe Airport do

  it "responds to the land method" do
    expect(subject).to respond_to :land
  end

  it "responds to the takeoff method" do
    expect(subject).to respond_to :takeoff
  end

  it "lands a plane when requested" do
    plane = Plane.new
    expect(subject.land(plane)).equal? plane  
  end

  it "takes off a plane" do
    plane = Plane.new
    expect(subject.takeoff(plane)).equal? plane
  end

  it "stores landed planes in hanger" do
    plane = Plane.new
    expect(subject.land(plane)).equal? plane
  end

  it "removes planes from hanger upon takeoff" do
    plane = Plane.new
    expect(subject.takeoff(plane)).equal? plane
  end

  it "removes specific plane requested from hanger upon takeoff" do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    expect(subject.takeoff(plane2)).equal? plane2
    expect(subject.takeoff(plane1)).equal? plane1
    expect(subject.takeoff(plane3)).equal? plane3
  end

  it "creates airport with a capacity of 20" do
    Airport.new(capacity = 20)
    expect(@capacity).equal? 20
  end

  it "creates airport with default capacity of 5" do
    Airport.new
    expect(@capacity).equal? 5
  end

  it "prevents landing when airport is at default capacity" do
    airport = Airport.new
    5.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error("The hanger is full.")
  end

  it "prevents landing if airport is at custom capacity" do
    big_airport = Airport.new(capacity = 20)
    20.times { big_airport.land(Plane.new) }
    expect { big_airport.land(Plane.new) }.to raise_error("The hanger is full.")
  end

  it "prevents landing if weather is stormy" do
    airport = Airport.new
    airport.weather(1)
    expect { airport.land(Plane.new) }.to raise_error("The weather is too rough.")
  end

  it "prevents takeoff if weather is stormy" do
    airport = Airport.new
    airport.weather(1)
    expect { airport.takeoff(Plane.new) }.to raise_error("The weather is too rough.")
  end

end

describe Plane do

end
