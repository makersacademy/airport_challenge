require 'airport'
require 'plane'

describe Airport do
  
  it "lands plane when instructed" do

    plane = Plane.new
    subject.land(plane)
    expect(subject.hanger).to include plane
  
  end

  it "takes off from airport when instructed, and is no longer at the airport" do

    plane = Plane.new
    subject.hanger << plane
    subject.take_off(plane)
    expect(subject.hanger).not_to include plane

  end

  it "checks whether the airport hanger is full" do

    plane = Plane.new
    5.times { subject.hanger << plane }
    expect(subject.full?).to eq true

  end

  it "prevents landing when the aiport hanger is full" do

    plane = Plane.new
    5.times { subject.hanger << plane }
    expect { subject.land(plane) }.to raise_error("The airport is full, please wait")

  end

  it "prevents take off when weather is stormy" do
    
    plane = Plane.new
    allow(subject).to receive(:random_weather) { 3 }
    expect { subject.can_take_off? }.to raise_error("It's blowin' a gale out there, hold your horses")

  end

  it "prevents landing when weather is stormy" do

    plane = Plane.new
    allow(subject).to receive(:random_weather) { 3 }
    expect { subject.can_land? }.to raise_error("It's blowin' a gale out there, hold your horses")

  end

  it "random_weather should generate a random number between 1 and 10" do
    
    expect(subject.random_weather).to be < 11
    expect(subject.random_weather).to be > 0

  end

  it "attempting to take off a plane that isn't present should raise an error" do

    plane = Plane.new
    expect { subject.take_off(plane) }.to raise_error("That plane is not available for take off")

  end

  it "attempting to land a plane that has already landed should raise an error" do

    plane = Plane.new
    subject.hanger << plane
    expect { subject.land(plane) }.to raise_error("That plane has already landed")

  end

end
