require_relative '../lib/airport.rb'

describe Airport do
  let(:airplane) {double :airplane}

  describe "#land"
  it "should let an airplane land" do
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "should not allow an airplane to land while airport is full" do
    allow(subject).to receive(:stormy?).and_return false
    Airport::DEFAULT_CAPACITY.times { subject.land(airplane) }
    expect { subject.land(airplane) }.to raise_error "Cannot land due to airport being full"
  end

  it "should prevent landing when weather is stormy" do
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.land(airplane) }.to raise_error "Cannot land due to stormy weather"
  end

  describe "#take_off"
  it "should let an airplane takeoff" do
    allow(subject).to receive(:stormy?).and_return false
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "should prevent takeoff when weather is stormy" do
    allow(subject).to receive(:stormy?).and_return true
    expect { subject.take_off(airplane) }.to raise_error "Cannot takeoff due to stormy weather"
  end
end