require "airport"

describe Airport do
  it "responds to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "stores a plane when it lands" do
    plane = double(:plane)
    expect(subject.land(plane)).to match_array [plane]
  end

  it "responds to take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "lands a plane and then removes it when it takes off" do
    plane = double(:plane)
    subject.land(plane)
    expect(subject.take_off).to eq plane
  end

  it "does not let a plane land if the airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(double(:plane)) }
    expect { subject.land(double(:plane)) }.to raise_error "Airport full"
  end
end