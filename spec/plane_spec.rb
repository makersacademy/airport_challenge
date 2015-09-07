require 'plane'

describe Plane do

  it 'is flying when created' do
    expect(subject.status).to eq(:flying)
  end

  it 'is landed after landing' do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land
    expect(subject.status).to eq (:landed)
  end

  it 'is flying after take off' do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.take_off
    expect(subject.take_off).to eq (:flying)
  end
end
