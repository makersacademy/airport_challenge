require "airport"
require "weather_spec"

describe Airport do

  it "Will create an instance of Airport" do
     expect(subject).to be_instance_of(Airport)
  end

  it "Will allow a plane to land in the airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "Will allow a plane to take off from the airport" do
    expect(subject).to respond_to(:take_off)
  end
  
  it "Will confirm a plane that has taken off is no longer in the airport" do
    expect {subject.take_off}.to raise_error "Airport empty; cannot take off."
  end
  
  describe "#land" do
    it "Will prevent landing if airport is full" do
      allow(subject).to receive(:weather_forcecast).and_return("Sunny")
      20.times { subject.land(Plane.new) } 
      expect {subject.land(Plane.new)}.to raise_error "Airport full; cannot land plane."
    end
  end

  it "Will have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "Will remove a plane" do
    allow(subject).to receive(:weather_forcecast).and_return("Sunny")
    subject.land(Plane.new)
    expect{subject.take_off}.to change{subject.airport.count}.by(-1)
  end
end