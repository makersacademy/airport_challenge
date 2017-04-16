require 'plane'
require 'airport'

describe Plane do
  let(:airport) {double :airport}
  it {is_expected.to respond_to :landed?}
  it {is_expected.not_to be_landed}

  it 'has landed status when landed' do
    allow(subject).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:land).with(subject)
    allow(subject).to receive(:landed?).and_return(true)
    airport.land(subject)
    expect(subject).to be_landed
  end

  it 'is not landed after take_off' do
    allow(subject).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:land).with(subject)
    allow(airport).to receive(:take_off)
    allow(subject).to receive(:landed?).and_return(true)
    airport.land(subject)
    airport.take_off
    allow(subject).to receive(:landed?).and_return(false)
    expect(subject).not_to be_landed
  end
end
