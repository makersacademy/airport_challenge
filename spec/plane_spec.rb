require 'plane'

describe Plane do
  let(:airport) { double :airport }
  it 'Can land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it 'Can takeoff' do
    subject.takeoff
    expect(subject.grounded).to be false
  end
  it 'can not land when grounded' do
    expect { subject.land(airport) }.to raise_error(RuntimeError, "Already grounded")
  end
end
