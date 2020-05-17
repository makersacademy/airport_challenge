require 'airport'

describe Airport do
  subject { Airport.new }

  let(:plane) { Plane.new }
  DEFAULT_CAPACITY = 15

  before do
    allow(subject).to receive(:rand) { 5 }
    plane.land(subject)
  end

  it "allows a plane to land and takes one argument" do
    allow(subject).to receive(:rand) { 5 }
    expect(subject).to respond_to(:landing).with(1).argument
  end

  it "adds a plane to the airport" do
    allow(subject).to receive(:rand) { 5 }
    expect(subject.instance_variable_get(:@hanger)).to include(plane)
  end

  it "alerts airport is full" do
    allow(subject).to receive(:rand) { 5 }
    (DEFAULT_CAPACITY - 1).times { subject.landing(Plane.new) }
    expect { subject.landing(Plane.new) }.to raise_error("Airport Full!")
  end

  it "allows a plane capacity of 15" do
    gatwick = Airport.new(15)
    15.times {
      allow(gatwick).to receive(:rand) { 5 }
      gatwick.landing(Plane.new)
    }
    expect { gatwick.landing(Plane.new) }.to raise_error("Airport Full!")
  end

  it "removes a plane from the airport" do
    allow(subject).to receive(:rand) { 5 }
    subject.depart(plane)
    expect(subject.instance_variable_get(:@hanger)).not_to include(plane)
  end

  it "alerts when plane has departed" do
    allow(subject).to receive(:rand) { 4 }
    expect { subject.depart(plane) }.to output("#{plane} departed!\n").to_stdout
  end

  it "returns sunny when random number is 5" do
    allow(subject).to receive(:rand) { 4 }
    expect(subject.weather).to eq "Sunny"
  end

end
