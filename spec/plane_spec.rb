require 'plane'

describe Plane do

  let(:airport) { double :Airport }
  let(:airport2) { double :Airport2 }

  it 'responds true to flying on creation' do
    expect(subject).to be_flying
  end

  it 'stops flying when landed' do
    subject.land(airport)
    expect(subject).not_to be_flying
  end

  it 'is flying after take off' do
    subject.land(airport)
    subject.take_off
    expect(subject).to be_flying
  end

  it 'has an airport when landed' do
    subject.land(airport)
    expect(subject.airport).to eq airport
  end

  it 'does not have an airport after take off' do
    subject.land(airport)
    subject.take_off
    expect(subject.airport).to eq nil
  end

  it 'raises an error if trying to take off when already in an airport' do
    subject.land(airport)
    expect { subject.land(airport2) }.to raise_error 'Plane already landed at another airport'
  end
end
