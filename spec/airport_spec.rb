require 'airport'

describe Airport do

  #it should respond to method 'take_off'
  it "should respond to the method with 1 arguement" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  #it should check is weather
  it "should check the weather" do
    expect(subject).to respond_to(:sunny?)
  end

  #randomly create a number and return weather status
  it "should randomly return 'sunny'" do
    allow(subject).to receive(:rand).and_return(6)
    expect(subject.sunny?).to eq("sunny")

  end

  it "should randomly return 'stormy'" do
    allow(subject).to receive(:rand).and_return(3)
    expect(subject.sunny?).to eq("stormy")

  end

  #it should respond to the method 'land'
  it "should land the plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  #land method returns a plane that's passed into it
  it "should land plane and return the plane object" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

  #airport should not be full
  it "should not be full" do
    expect(subject.full?).to eq false
  end

  #airport should release plane on takeoff
  it "should forget variable after takeoff" do
    plane = Plane.new
    expect(subject.take_off(plane)).to be_nil
  end

  #weather override
  it "should have a weather overide" do
    expect(subject).to respond_to(:weather_override).with(1).argument
  end
end