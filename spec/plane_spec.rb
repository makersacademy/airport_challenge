require "plane"

describe Plane do
  let(:airport) { double(:receive_plane => false, :release_plane => true) }
  let(:bad_weather) { double(:report => "stormy")}
  let(:good_weather) { double(:report => "good") }
  let(:bad_weather_airport_accepts_landing) { double(:receive_plane => nil, :release_plane => false)}
  let(:bad_weather_airport) { double(:receive_plane => "Plane could not land due to bad weather", :release_plane => false)}

  #user story 1
  it { expect(subject).to respond_to(:land).with(1).argument }
  it { expect(subject.land(airport)).to eq("Plane has landed") }
  it "Plane.flying should equal to false once the plane has landed" do
    plane = Plane.new
    plane.land(airport)
    expect(plane.flying).to eq(false)
  end

  #user story 2: plane can take off

  it "Plane.flying should equal true when the plane has taken off from an airport and plane.landed_in should equal nil" do
    subject.land(airport)
    subject.fly
    expect(subject.flying).to eq(true)
    expect(subject.landed_in).to eq(nil)
  end

  #user story 3: plane can't take off when release plane returns false
  it "plane can't take off when release plane returns false" do
      subject.land(bad_weather_airport_accepts_landing)
      expect(subject.fly).to eq("Plane could not take off due to weather")
      expect(subject.landed_in).to eq(bad_weather_airport_accepts_landing)
      expect(subject.flying).to eq(false)
  end

  it "plane can't land when weather is stormy" do
    expect(subject.land(bad_weather_airport)).to eq("Plane could not land due to bad weather")
  end

end
