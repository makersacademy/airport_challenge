require 'airport'

describe Airport do

  let(:plane) {double :plane}
  let(:stormy) {double :stormy}
  let(:weather) {double :weather}

  it "instructs a plane to land" do
    allow(subject).to receive(:too_stormy?).and_return false
    # expect(plane).to receive(:land)
    subject.land_plane(plane)
  end

  it "confirms if a plane has landed" do
    allow(subject).to receive(:too_stormy?).and_return false
    # expect(plane).to receive(:land)
    expect(subject.land_plane(plane)).to include plane
  end

  it "instructs a plane to take off" do
    allow(subject).to receive(:too_stormy?).and_return false
    # expect(plane).to receive(:take_off)
    subject.plane_takes_off(plane)
  end

  it "confirms if a plane has taken off" do
    allow(subject).to receive(:too_stormy?).and_return false
    # expect(plane).to receive(:take_off)
    expect(subject.plane_takes_off(plane)).to_not include plane
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "checks that an airport capacity can be set" do
    expect(Airport.new(20).capacity).to eq 20
  end

  it "stops a plane from landing if the airport is full" do
    allow(subject).to receive(:too_stormy?).and_return false
    # subject.capacity.times { expect(plane).to receive(:land) }
    subject.capacity.times { subject.land_plane(plane) }
    expect{subject.land_plane(plane)}.to raise_error("Airport full!")
  end

# I was having issues getting this test to pass, and used this advice
# https://github.com/makersacademy/slack-overflow/issues/158
  it "stops a plane from taking off if there is stormy weather" do
    allow(subject).to receive(:too_stormy?).and_return true
    # expect(plane).to receive(:take_off)
    expect{subject.plane_takes_off(plane)}.to raise_error("It's too stormy to take off!")
  end

  it "stops a plane from landing if there is stormy weather" do
    allow(subject).to receive(:too_stormy?).and_return true
    # expect(plane).to receive(:take_off)
    expect{subject.land_plane(plane)}.to raise_error("It's too stormy to land!")
  end

end
