require 'airport'

describe Airport do

  it { is_expected.to be_an_instance_of(Airport) }

  it "should return airport name as a string" do
    expect(subject.name).to be_a(String)
  end

  it "should return airport space as an integer" do
    expect(subject.airport_space).to be_a(Integer)
  end

  it "should return landing area as an array" do
    expect(subject.landing_area).to be_a(Array)
  end

  it "should accept 'land' method for landing" do
    expect(subject).to respond_to(:accept_landing).with(1)
  end

  it "should return the numbers of all planes in the airport" do
    airport = Airport.new
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    airport.accept_landing(Plane.new(1), weather)
    expect(airport.show_planes).to eql("Plane 1")
  end

  it "should only accept an instance of 'Plane' for landing" do
    fake_plane = double("not_a_plane")
    weather = Weather.new
    weather.instance_variable_set("@state", 1)
    expect { subject.accept_landing(fake_plane, weather) }.to raise_error "Not a plane, please do not land!"
  end

  it "should accept 'take_off' method" do
    expect(subject).to respond_to(:take_off).with(2)
  end

  it "should return plane's landing position, i.e. index in landing area array" do
    
  end
end
