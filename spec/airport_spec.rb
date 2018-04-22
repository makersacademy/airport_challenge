require 'airport'

describe Airport do
let(:plane) {double :plane}

  it "allows a plane to land" do
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "allows a plane to take off from an airport" do
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "allows the user to check if a plane is in the airport" do
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    expect(subject.is_plane_present?(plane)).to eq(true)
    subject.take_off(plane)
    expect(subject.is_plane_present?(plane)).to eq(false)
  end

  it "prevents planes taking off if weather is stormy" do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.take_off(plane) }.to raise_error(RuntimeError)
  end

  it "prevents planes landing if weather is stormy" do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.land(plane) }.to raise_error(RuntimeError)
  end

  it "prevents planes landing if capacity is full" do
    allow(subject).to receive(:weather) { "sunny" }
    20.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error(RuntimeError)
  end

  it "allows default airport capcity to be overridden" do
    new_airport = Airport.new(10)
    expect(new_airport.DEFAULT_CAPACITY).to eq(10)
  end

end
