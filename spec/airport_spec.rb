require "airport"

describe Airport do
  let(:plane) { double }
  let(:rejected_plane) { double }
  let(:landed_plane) { double }
  let(:bad_weather) { double(:report => "stormy") }
  let(:good_weather) { double(:report => "good") }
  it { expect(subject).to respond_to(:receive_plane).with(1).argument }
  it "Once landed the plane appears in the aiport @landed_planes" do
    subject.receive_plane(plane)
    expect(subject.landed_planes).to include(plane)
  end
  it { expect(Airport::DEFAULT_CAPACITY).to eq(20) }
  it "can change the capacity when initialising airport" do
    airport_test = Airport.new(50)
    expect(airport_test.capacity).to eq(50)
  end

  it "prevents landing any more planes when airport has reached capacity" do
    small_airport = Airport.new(1)
    small_airport.receive_plane(plane)
    small_airport.receive_plane(rejected_plane)
    expect(small_airport.landed_planes).not_to include(rejected_plane)
  end

  it "if the weather is bad the plane cannot take off" do
    subject.receive_plane(landed_plane)
    expect(subject.release_plane(landed_plane, bad_weather.report)).to eq(false)
  end
end
