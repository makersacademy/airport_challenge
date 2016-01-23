require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:landed?)}
  it { is_expected.to respond_to(:takeoff).with(1).argument}

  let(:airport){ double :airport }

  it ' (if weather = sunny, airport != full) responds to the "landed?" method with "true" after receiving the "land" method'do
    allow(airport).to receive(:full?).and_return(false)
    allow(airport).to receive(:planes).and_return([])
    subject.land(airport, "sunny")
    expect(subject.landed?).to eq true
  end

  it ' (if weather = stormy, airport != full) responds to the "landed?" method with "false" after receiving the "land" method'do
    allow(airport).to receive(:full?).and_return(false)
    allow(airport).to receive(:planes).and_return([])
    subject.land(airport, "stormy")
    expect(subject.landed?).to eq false
  end

  it '(if weather = sunny, airport = full) responds to the "landed?" method with "false after receiving the "land" method'do
    allow(airport).to receive(:full?).and_return(true)
    allow(airport).to receive(:planes).and_return([])
    subject.land(airport, "sunny")
    expect(subject.landed?).to eq false
  end

  it ' (if weather = sunny) responds to the "landed?" method with "false" after receiving the "takeoff" method'do
    allow(airport).to receive(:planes).and_return([subject])
    subject.takeoff(airport, "sunny")
    expect(subject.landed?).to eq false
  end

  it ' (if weather = stormy) responds to the "landed?" method with "true" after receiving the "takeoff" method'do
    allow(airport).to receive(:planes).and_return([subject])
    subject.takeoff(airport, "stormy")
    expect(subject.landed?).to eq true
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
