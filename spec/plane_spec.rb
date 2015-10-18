require 'plane'

describe Plane do

  let(:airport) { double('airport', land: nil, take_off: nil)}

  it 'lands on command' do
    subject.land(airport)
    expect(subject).to_not be_flying
  end

  it 'takes-off on command' do
    subject.land(airport)
    subject.take_off
    expect(subject).to be_flying
  end

  it 'refuses to land if airport full' do
    allow(airport).to receive(:land).and_raise('Airport full.')
    expect { subject.land(airport) }.to raise_error 'Airport full.'
  end

end
