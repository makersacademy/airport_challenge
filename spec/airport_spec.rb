require './lib/airport'
describe Airport do
  let(:test_plane) { double(:test_plane) }

  it "Should have a land method with an object to land as an argument" do
    is_expected.to respond_to(:land).with(1).argument
  end

  it "Should not be able to land planes that have already landed" do
    srand(1000)
    subject.land(test_plane)
    expect { subject.land(test_plane) }.to raise_error("Cannot land plane that has landed!")
  end

  it "Should be able to view planes that have landed at it's site" do
    srand(1000)
    subject.land(test_plane)
    expect(subject.planes).to include test_plane
  end

  it "Should not land planes while the weather is stormy" do
    srand(1001)
    expect { subject.land(test_plane) }.to raise_error("Cannot land plane while weather is stormy!")
  end

  it "Should have a takeoff method with an object to do so as an argument" do
    is_expected.to respond_to(:takeoff).with(1).argument
  end

  it "Should not be able to takeoff a plane that is not at the airport" do
    srand(1000)
    subject.land(test_plane)
    subject.takeoff(test_plane)
    expect { subject.takeoff(test_plane) }.to raise_error("Cannot takeoff a plane that isn't on site!")
  end

  it "Should no longer have any planes that have taken off at site" do
    srand(1000)
    subject.land(test_plane)
    expect(subject.planes).to include test_plane
    subject.takeoff(test_plane)
    expect(subject.planes).not_to include test_plane
  end

  it "Should not takeoff planes while the weather is stormy" do
    srand(1000)
    subject.land(test_plane)
    srand(1001)
    subject.weather_update
    expect { subject.takeoff(test_plane) }.to raise_error("Cannot takeoff plane while weather is stormy!")
  end

  it "Should be able to set capacity of airport" do
    expect((Airport.new(1)).capacity).to eq 1
  end

  it "Should have a default capacity" do
    expect((Airport.new).capacity).to eq 100
  end

  it "Should not be able to land more planes on site than maximum capacity" do
    srand(1000)
    subject = Airport.new(0)
    expect { subject.land(test_plane) }.to raise_error("Cannot land more planes on site than maximum capacity!")
  end

end
