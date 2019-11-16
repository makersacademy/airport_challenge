require "airport"
require "plane"

describe Airport do
  describe "#land" do
    #Land a plane
    it "should land a plane at an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
    end
  

    #Raise error when the airport is full
    it "should raise error when the airport is full" do
    50.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error ("The airport is full")
    end

    #Raise error when it is stormy
    it "should prevent landing when weather is stormy" do
    expect { subject.land(Plane.new) }.to raise_error ("Cannot land because of the storm") if subject.weather == "stormy"
    end
  end

  describe "＃take_off" do
    #A plane to take off
    it "should instuct a plane to take off" do
    expect(subject).to respond_to(:take_off)
    end
  
    #Confirm the takeoff
    it "should confirm if the plane has taken off" do
    expect(subject.takeoff?).to eq(true)
    end


  end

  describe "#weather" do
    #Generate a random weather
    it "should tell us the weather" do
    expect(subject.weather).to eq(subject.weather)
    end
  end
end