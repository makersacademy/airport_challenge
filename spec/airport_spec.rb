require './lib/airport'
describe Airport do
  let(:test_plane) { double(:test_plane) }
  let(:weather) { double(:weather, :conditions => "CLEAR") }
  subject(:airport) { described_class.new(Airport::DEFAULT_CAPACITY, weather) }

  it "Should have a land method with an object to land as an argument" do
    is_expected.to respond_to(:land).with(1).argument
  end

  it "Should not be able to land planes that have already landed" do
    subject.land(test_plane)
    expect { subject.land(test_plane) }.to raise_error("Cannot land plane that has landed!")
  end

  it "Should be able to view planes that have landed at it's site" do
    subject.land(test_plane)
    expect(subject.planes).to include test_plane
  end

  it "Should not land planes while the weather is stormy" do
    allow(weather).to receive(:conditions).and_return("STORMY")
    expect { subject.land(test_plane) }.to raise_error("Cannot land plane while weather is stormy!")
  end

  it "Should have a takeoff method with an object to do so as an argument" do
    is_expected.to respond_to(:takeoff).with(1).argument
  end

  it "Should not be able to takeoff a plane that is not at the airport" do
    subject.land(test_plane)
    subject.takeoff(test_plane)
    expect { subject.takeoff(test_plane) }.to raise_error("Cannot takeoff a plane that isn't on site!")
  end

  it "Should no longer have any planes that have taken off at site" do
    subject.land(test_plane)
    expect(subject.planes).to include test_plane
    subject.takeoff(test_plane)
    expect(subject.planes).not_to include test_plane
  end

  it "Should not takeoff planes while the weather is stormy" do
    subject.land(test_plane)
    allow(weather).to receive(:conditions).and_return("STORMY")
    weather.conditions
    expect { subject.takeoff(test_plane) }.to raise_error("Cannot takeoff plane while weather is stormy!")
  end

  it "Should be able to set capacity of airport" do
    expect((Airport.new(1)).capacity).to eq 1
  end

  it "Should have a default capacity" do
    expect((Airport.new).capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "Should not be able to land more planes on site than maximum capacity" do
    subject = Airport.new(0)
    expect { subject.land(test_plane) }.to raise_error("Cannot land more planes on site than maximum capacity!")
  end

  it "Should receive multiple planes" do
    3.times { subject.land(Plane.new) }
    expect(subject.planes.length).to eq 3
    3.times { subject.takeoff(subject.planes[0]) }
    expect(subject.planes.length).to eq 0
  end

end
