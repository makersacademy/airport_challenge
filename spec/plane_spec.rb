require 'plane'

describe Plane do

  let(:airport) { double('airport', land: nil, take_off: nil) }

  it 'lands on command' do
    allow(Weather).to receive(:stormy?).and_return(false)
    subject.land(airport)
    expect(subject).to_not be_flying
  end

  it 'takes-off on command' do
    allow(Weather).to receive(:stormy?).and_return(false)
    subject.land(airport)
    subject.take_off
    expect(subject).to be_flying
  end

  it 'refuses to land if airport full' do
    allow(Weather).to receive(:stormy?).and_return(false)
    allow(airport).to receive(:land).and_raise('Airport full.')
    expect { subject.land(airport) }.to raise_error 'Airport full.'
  end

  it 'refuses to land if weather is stormy' do
    allow(Weather).to receive(:stormy?).and_return(true)
    expect { subject.land(airport) }.to raise_error 'Too stormy.'
  end

  it 'planes are created flying' do
    expect(subject).to be_flying
  end

  it 'cannot take-off an already flying plane' do
    expect { subject.take_off }.to raise_error 'Already flying.'
  end

  it 'a flying plane does not have an airport' do
    expect(subject.location).to eq nil
  end

  it 'a plane that is not flying must be in an airport' do
    allow(Weather).to receive(:stormy?).and_return(false)
    subject.land(airport)
    expect(subject.location).to eq airport
  end

  it 'a plane that is not flying cannot land' do
    allow(Weather).to receive(:stormy?).and_return(false)
    subject.land(airport)
    expect { subject.land(airport) }.to raise_error 'Already landed.'
  end

end
