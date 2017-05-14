describe 'User Stories' do

  it "Allows ATC to instruct plane to land at airport" do
    airport = Airport.new(2)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  it "Allows ATC to instruct a plane to take off" do
    airport = Airport.new(2)
    plane = Plane.new
    expect { airport.takeoff(plane) }.not_to raise_error
  end

  context "When airport is stormy"
  it "Does not allow planes to land" do
    airport = Airport.new(2)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Cannot land - Stormy"
  end
end
  context "When airport is full" do
    it "Does not allow planes to land" do
      airport = Airport.new(2)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
      2.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Cannot land - Airport full!"
    end
end
