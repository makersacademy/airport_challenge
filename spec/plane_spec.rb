require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:landed)}
  it { is_expected.to respond_to(:takeoff).with(1).argument}

  let(:airport){ double :airport }

  describe '#landed'do
    it 'responds "true"(weather = sunny, airport != full) after receiving "land" method'do
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:planes).and_return([])
      subject.land(airport, "sunny")
      expect(subject.landed).to eq true
    end

    it 'responds "false "(weather = stormy, airport != full) after receiving "land" method'do
      allow(airport).to receive(:full?).and_return(false)
      allow(airport).to receive(:planes).and_return([])
      subject.land(airport, "stormy")
      expect(subject.landed).to eq false
    end

    it 'responds "false" (weather = sunny, airport = full) after receiving "land" method'do
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:planes).and_return([])
      subject.land(airport, "sunny")
      expect(subject.landed).to eq false
    end
    it 'responds "false" (weather = stormy, airport = full) after receiving "land" method'do
      allow(airport).to receive(:full?).and_return(true)
      allow(airport).to receive(:planes).and_return([])
      subject.land(airport, "stormy")
      expect(subject.landed).to eq false
    end

    it ' reponds "false"(weather = sunny) after receiving "takeoff" method'do
      allow(airport).to receive(:planes).and_return([subject])
      subject.takeoff(airport, "sunny")
      expect(subject.landed).to eq false
    end

    it ' responds "true" (weather = stormy) after receiving "takeoff" method'do
      allow(airport).to receive(:planes).and_return([subject])
      subject.takeoff(airport, "stormy")
      expect(subject.landed).to eq true
    end
  end

  it 'raises an error when landing a landed plane'do
    allow(airport).to receive(:full?).and_return(false)
    allow(airport).to receive(:planes).and_return([])
    subject.land(airport, "sunny")
    expect{ subject.land(airport, "sunny") }.to raise_error("Already Landed")
  end
  it 'raises an error when taking off from the wrong airport'do
    allow(airport).to receive(:planes).and_return([])
    expect{ subject.takeoff(airport, "sunny") }.to raise_error("Not At Airport")
  end

end
