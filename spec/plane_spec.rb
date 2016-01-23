require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:landed?)}
  it { is_expected.to respond_to(:takeoff)}

  let(:airport){ double :airport }

  it ' (if weather = sunny, airport != full) responds to the "landed?" method with "true" after receiving the "land" method'do
    allow(airport).to receive(:full?).and_return(false)
    subject.land(airport, "sunny")
    expect(subject.landed?).to eq true
  end

  it ' (if weather = stormy, airport != full) responds to the "landed?" method with "false" after receiving the "land" method'do
    allow(airport).to receive(:full?).and_return(false)
    subject.land(airport, "stormy")
    expect(subject.landed?).to eq false
  end

  it '(if weather = sunny, airport = full) responds to the "landed?" method with "false after receiving the "land" method'do
    allow(airport).to receive(:full?).and_return(true)
    subject.land(airport, "sunny")
    expect(subject.landed?).to eq false
  end
  
  it ' (if weather = sunny) responds to the "landed?" method with "false" after receiving the "takeoff" method'do
    subject.takeoff("sunny")
    expect(subject.landed?).to eq false
  end

  it ' (if weather = stormy) responds to the "landed?" method with "true" after receiving the "takeoff" method'do
    subject.takeoff("stormy")
    expect(subject.landed?).to eq true
  end
end
