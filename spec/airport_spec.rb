require './lib/airport'

describe Airport do

  let(:plane) { double :plane }

  before do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
    allow(subject).to receive(:stormy?).and_return(false)
  end

  it "makes an instance of the Airport class" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  it { should respond_to(:land).with(1).argument }

  it { should respond_to(:take_off).with(1).argument }

  it "should show a plane that has landed" do
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it "should confirm a plane is no longer in the airport after take off" do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq []
  end

  it "should prevent landing when the aiport is full" do
    expect { (Airport::DEFAULT_AIRPORT_CAPACITY + 1).times { subject.land(double :plane) } }.to raise_error "Airport is full"
  end

  it "defaults to a capacity equal to the default airport capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_AIRPORT_CAPACITY
  end

  it "should allow the user to specify a different capacity" do
    capacity = 15
    airport = Airport.new(15)
    expect(airport.capacity).to eq capacity
  end

  it "should only allow planes present in the airport to take off from the airport" do
    expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
  end

  it "should not allow the same plane to land twice" do
    expect { 2.times { subject.land(plane) } }.to raise_error "Plane already in the airport"
  end

  it "should not allow a plane to land if the weather is stormy" do
    allow(subject).to receive(:stormy?).and_return(true)
    expect {subject.land(plane)}.to raise_error "Plane can't land in storm."
  end

  it "should not allow a plane to take off if the weather is stormy" do
    allow(subject).to receive(:stormy?).and_return(true)
    expect {subject.take_off(plane)}.to raise_error "Plane can't take off in storm."
  end

  # it "should not allow planes to land if the weather is stormy"
  # airport = Airport.new
  # expect
end
