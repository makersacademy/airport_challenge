require 'airport'
require 'plane'
require 'weather'
describe Airport do
  heathrow = Airport.new
  plane = Plane.new
  # I can instruct a plane to land at an airport.
  it { is_expected.to respond_to :land_plane }
  # I can instruct a plane to take-off.
  it { is_expected.to respond_to :take_off }
  it 'responds to a question if the weather is bad' do
    expect(heathrow).to respond_to(:bad_weather?)
  end
  # I can confirm the plane is no longer at the airport.
  it "releases a plane for take off" do
    allow(subject).to receive(:bad_weather?) { false }
     subject.land_plane(plane)
     expect(subject.take_off).to eq plane
  end
  # landing a plane
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it "lands a plane" do
    allow(subject).to receive(:bad_weather?) { false }
    expect(subject.land_plane(plane)).to eq plane
  end
  it "raises an error when the airport capacity is already full" do
    Airport::CAPACITY.times { subject.land_plane(plane) }
    allow(heathrow).to receive(:bad_weather?) { false }
    expect { subject.land_plane(plane) }.to raise_error 'Airport is full'
  end
  it 'raises an error when the plane is not at the airport' do
    allow(heathrow).to receive(:bad_weather?) { false }
    expect { subject.take_off }.to raise_error 'That plane is not here'
  end
  it "Won't let a plane land if the weather is bad" do
    allow(heathrow).to receive(:bad_weather?) { true }
    expect { heathrow.land_plane(plane) }.to raise_error "Weather is stormy, cannot land"
  end
it "Won't let a plane take-off if the weather is bad" do
  allow(heathrow).to receive(:bad_weather?) { true }
  expect { heathrow.take_off }.to raise_error "Weather is stormy, cannot take off"
end
end
