require 'airport'

describe Airport do
  let(:plane) {double(:plane)}
  before(:each) do
    allow(plane).to receive(:flying).and_return(true, false)
    allow(subject).to receive(:stormy?).and_return(false, false)
    allow(plane).to receive(:landed)
    allow(plane).to receive(:fly)
  end
  it 'should instruct a plane to land' do
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'should instruct a plane to take off' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'should prevent planes landiing when full' do
    subject.land(plane)
    message = 'Airport is full'
    expect{subject.land(plane)}.to raise_error(message)
  end

  it 'should prevent planes from landing when weather is stormy' do
    allow(subject).to receive(:stormy?).and_return(true)
    message = 'Weather is stormy'
    expect{subject.land(plane)}.to raise_error(message)
  end

  it 'should prevent planes from taking off when the weather is stormy' do
    allow(subject).to receive(:stormy?).and_return(false, true)
    pl = Plane.new
    subject.land(pl)
    message = 'Weather is stormy'
    expect{subject.take_off(pl)}.to raise_error(message)
  end

  it 'should only allow planes to take off if they are in airport' do
    allow(subject).to receive(:stormy?).and_return(false)
    expect { subject.take_off(plane) }.to raise_error('The plane is not in this airport')
  end
end
