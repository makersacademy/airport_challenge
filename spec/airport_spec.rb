require './docs/airport.rb'


describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }
  it "creates a plane" do
    expect(subject).to respond_to (:create_planes)
end
#one issue here is that h does not reset the orignal airport instance
#this is also not testing that h resets the @planes of the orignal airport instance.
#this test needs improving:

#This needs refactoring also
  it "the plane has left the airport instance once it has taken off" do
    airport = Airport.new
    plane1 = airport.create_planes
    h = airport.take_off(plane1)
    airport.planes = h
    expect(airport.planes).to eq nil
end
end
