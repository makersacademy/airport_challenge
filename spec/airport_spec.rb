require 'airport'

describe Airport do

  let(:plane) { double(:plane, :passengers => []) }

  it "can store planes" do
    subject.planes << plane
    expect(subject.planes).to include(plane)
  end

  it "can confirm_departure" do
    allow(plane).to receive(:parked_in?) { false }
    subject.planes << plane
    subject.stormy = false
    subject.planes.pop
    expect(subject.confirm_departure(plane)).to eq("#{plane} has successfully departed")
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq($DEFAULT_CAPACITY)
  end

  it "can be full" do
    airport = Airport.new(1)
    airport.planes << plane
    expect(airport).to be_full
  end
end
