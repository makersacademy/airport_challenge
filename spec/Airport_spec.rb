require "airport"
require "plane"
require "weather"

describe Airport do
  subject(:Airport) { described_class.new }
  let(:plane) { double :plane }

# Landing tests

  it { expect(subject).to respond_to(:land).with(1).argument }

  it "should allow planes to land" do
    allow(subject).to receive(:bad_weather?).and_return(false)
    allow(subject).to receive(:full?).and_return(false)
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "should only allow airborne plays to land" do
    plane = Plane.new
    expect { subject.land(plane, false) }.to raise_error "Plane not in the air"
  end

  it 'a plane can not land at an airport it has already landed at' do
    allow(subject).to receive(:bad_weather?).and_return(false)
    allow(subject).to receive(:full?).and_return(false)
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error "This plane has already landed at this airport"
  end

  it "does not allow plane to land when weather is stormy" do
    plane = Plane.new
    allow(subject).to receive(:bad_weather?).and_return(true)
    expect { subject.land(plane) }.to raise_error "Stormy weather - plane can not land"
  end

  it "allows plane to land in good weather" do
    plane = Plane.new
    allow(subject).to receive(:bad_weather?).and_return(false)
    expect { subject.land(plane) }.not_to raise_error
  end

# Depart tests

  it { expect(subject).to respond_to :depart }

  it { expect(subject).to respond_to :show_planes }

  it { expect(subject).to respond_to :stock_planes }

  it 'a plane can only take off from an airport it is at' do
    plane = Plane.new
    expect { subject.depart(plane) }.to raise_error "This plane is not at this airport"
  end

  it "a plane that has departed should no longer be in airport" do
    allow(subject).to receive(:bad_weather?).and_return(false)
    plane = Plane.new
    subject.land(plane)
    subject.depart(plane)
    expect(subject.planes.length).to eq 0
  end

  it "should show all the planes in the airport" do
    subject.stock_planes(15)
    expect(subject.show_planes.length).to eq 15
  end

  it "A plane can not depart when weather is stormy" do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:bad_weather?).and_return(true)
    allow(subject).to receive(:full?).and_return(false)
    expect { subject.depart(plane) }.to raise_error "Stormy weather - flights suspended"
  end

  it "a plane can depart after storm has cleared" do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:full?).and_return(false)
    allow(subject).to receive(:bad_weather?).and_return(false)
    expect { subject.depart(plane) }.not_to raise_error
  end

  # Capacity tests

  it "should have a default capacity (10)" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "can have a custom capacity" do
    airport = Airport.new(100)
    expect(airport.capacity).to eq 100
  end

  it "planes can not land when airport is full" do
    plane = Plane.new
    subject.stock_planes
    expect { subject.land(plane) }.to raise_error "Airport full"
  end

end
