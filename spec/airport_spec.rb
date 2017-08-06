require './lib/airport.rb'

describe Airport do
  it "respond to method land" do
    expect(subject).to respond_to(:land)
  end
  it "respond to method take_off" do
    expect(subject).to respond_to(:take_off)
  end
  it "plane takes off and no more planes left" do
    plane = Plane.new
    allow(Weather).to receive(:climate) { 0 }
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.instance_variable_get(:@planes).empty?).to eq(true)
  end
  it "plane is no longer in the airport" do
    expect { subject.take_off(:plane) }.to raise_error('No planes present')
  end
  it "preventing take-off when stormy" do
    plane = Plane.new
    weather = Weather.new
    weather = double("book")
    allow(subject).to receive(:climate) { 5 }
    subject.land(plane)
    expect { subject.take_off(plane) }.to raise_error('Take-off prevented, inclement weather')
  end

end
