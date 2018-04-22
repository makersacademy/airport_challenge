require 'airport'

describe Airport do
let(:plane) {double :plane}

  it "allows a plane to land" do
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "allows a plane to take off from an airport" do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "allows the user to check if a plane is in the airport" do
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
    20.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error(RuntimeError)
  end

end
