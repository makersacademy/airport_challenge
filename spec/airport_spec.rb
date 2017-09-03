require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it "instructs the plane to land" do
    #plane = Plane.new
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:land)
    subject.land(:plane)
  end

  it "instructs the plane to take_off" do
    #plane = Plane.new
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:take_off)
    subject.take_off(plane)
  end

  #it "has the plane after it has landed " do
    #allow(plane).to receive :land
    #subject.land plane
    #expect(subject.land(plane)).to include plane
  #end

  it "confirms plane has taken_off" do
    #plane = Plane.new
    allow(subject).to receive(:stormy?).and_return false
    allow(plane).to receive :take_off
    subject.take_off(plane)
    expect(subject.taken_off?(plane)).to eq true
  end

  it "prevents take_off if weather is stormy" do
    #plane = Plane.new
    allow(subject).to receive(:stormy?).and_return true
    expect{ subject.take_off(:plane) }.to raise_error "Unable to take_off due to stormy weather"
  end

  it "prevents landing if weather is stormy" do
    #plane = Plane.new
    allow(subject).to receive(:stormy?).and_return true
    expect{ subject.land(:plane) }.to raise_error "Unable to land due to stormy weather"
  end

  it "prevents landing if airport is full" do
    #plane = Plane.new
    allow(subject).to receive(:stormy?).and_return false
    allow(subject).to receive(:full?).and_return true
    message = "Unable to land due to full capacity"
    expect{ subject.land(:plane) }.to raise_error message
  end
end
