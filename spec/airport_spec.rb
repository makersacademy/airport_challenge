require 'airport'
require 'plane'

describe Airport do
  it "responds to land_plane" do
    expect(subject).to respond_to(:land_plane)
  end

  it 'adds plane to the runway if landing is approved' do
    plane = Plane.new
    subject.add_plane(plane)
    allow(subject).to receive(:storm) { false }
    subject.take_off(plane)
    subject.land_plane(plane)
    expect(subject.runway).to include(plane)
  end

  it "responds to take_off" do
    expect(subject).to respond_to :take_off
  end

  it "gives permission for take off" do
    plane = Plane.new
    subject.add_plane(plane)
    allow(subject).to receive(:storm) { false }
    expect(subject.take_off(plane)).to eq true unless plane.flying? == true
  end

  it "prevents landing when the runway is full (capacity is 20 planes)" do
    20.times do
      plane = Plane.new
      subject.add_plane(plane)
    end
    expect(subject.full?).to eq true
  end

  it "prevents take_off when the weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    subject.add_plane(plane)
    allow(airport).to receive(:storm) { true }
    airport.take_off(plane)
    expect(plane.flying?).to eq false
  end

  it "prevents land_plane when the weather is stormy" do
    airport = Airport.new
    plane = Plane.new
    plane.in_air
    allow(airport).to receive(:storm) { true }
    airport.land_plane(plane)
    expect(plane.flying?).to eq true
  end

  it "has a default capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq 20
  end

  it "the default capacity can be overwritten" do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end

  it "generates a storm randomly" do
    storm_checker = Array.new
    100.times do
      subject.storm
      storm_checker << subject.weather
    end
    expected = [1, 10]
    actual = storm_checker.minmax
    expect(actual).to eq(expected)
  end

  it "adds new planes to runway" do
    plane = Plane.new
    subject.add_plane(plane)
    expect(subject.runway).to include(plane)
  end

  it "won't add a new plane to the runway if the airport is full" do
    20.times do
      subject.add_plane Plane.new
    end
    expect(subject.full?).to eq true
  end

  it "prevents take_off if plane is not on runway" do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.flying?).to be false
  end

  it "removes the plane from the runway after take_off" do
    plane = Plane.new
    subject.add_plane(plane)
    subject.take_off(plane)
    expect(subject.runway).not_to include(plane)
  end

end
