require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double :plane}

  it "instructs planes to land and confirms it has landed" do
    allow(subject).to receive(:stormy?).and_return(false)
    expect(subject.land(plane)).to eq "#{plane} has landed"
  end
  it "instructs planes to take off and confirms it's no longer at the airport" do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} is up in the air"
  end

  describe "#Stormy weather" do
    it "prevents planes form taking off if the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.takeoff(plane) }.to raise_error ("Weather is stormy. Couldn't take off")
    end
    it "prevents planes form landing if the weather is stormy" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error ("Weather is stormy. Couldn't land")
    end
  end


end
