require 'airport'

describe Airport do
  
  #test 1, it should respond to a method 'land'
  # it "it should respond to the method with 1 arguement" do
  #   expect(subject).to respond_to(:land).with(1).argument
  # end

  #test 2, it should respond to method 'take_off'
  it "should respond to the method with 1 arguement" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  #test 3, it should check is weather
  it "should check the weather" do
    expect(subject).to respond_to(:sunny?)
  end

  #it should randomly create a number and return weather status
  it "should randomly return true" do
    allow(subject).to receive(:rand).and_return(6)
    expect(subject.sunny?).to eq("sunny")

  end

  #test 4 it should respond to the method 'land'
  it "should land the plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  #test 5 land method returns a plane that's passed into it
  it "should land plane and return the plane object" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq plane
  end

  #test 6 airport should not be full
  it "should not be full" do
    expect(subject.full?).to eq false
  end

  #test 7 airport should release plane on takeoff
  it "should forget variable after takeoff" do
    plane = Plane.new
    expect(subject.take_off(plane)).to be_nil
  end

  # test 8 weather override
  it "should have a weather overide" do
    expect(subject).to respond_to(:weather_override_sunny?)
  end

  


end