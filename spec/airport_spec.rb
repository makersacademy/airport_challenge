require './docs/airport.rb'


describe Airport do
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:landing).with(1).argument }
  it "creates a plane" do
    expect(subject).to respond_to (:create_planes)
end
  it "the plane has left the airport instance once it has taken off" do
    airport = Airport.new
    plane1 = airport.create_planes
    h = airport.take_off(plane1)
    expect(h).to eq nil
end
end
