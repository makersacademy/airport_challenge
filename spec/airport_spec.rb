require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double :plane}

  it "instructs planes to land and confirms it has landed" do
    allow(subject).to receive(:stormy?).and_return(false)
    expect(subject.land(plane)).to eq "#{plane} has landed"
  end
  it "instructs planes to take off" do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} is up in the air"
  end

  describe "#Stormy weather" do
    it "prevents planes form taking off if the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error "Stormy weather!"
    end
    it "prevents planes form landing if the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Stormy weather!"
    end
  end

  describe "#Capacity" do
    it "prevents planes form landing if the airport if full" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.instance_variable_get(:@capacity).times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "There is no space"
    end
    it "can be overridden" do
      airport1 = Airport.new(66)
      expect(airport1.instance_variable_get(:@capacity)).to eq 66
    end
  end

end
