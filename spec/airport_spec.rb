require 'airport'

describe Airport do
  
  it 'responds to land' do
    expect(subject).to  respond_to(:land).with(1).argument
  end
  
  it 'check if plane is at airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end
  
  it 'responds to takeoff' do
    expect(subject).to respond_to(:takeoff)
  end
  
  it 'check is plane is in airport' do
    subject.land(Plane.new)
    expect(subject.parked).to eq true
  end
  
  it 'check if plane has left airport' do
    subject.land(Plane.new)
    subject.takeoff
    allow(subject).to receive(:stormy?) { false }
    expect(subject.parked).to eq false
  end
  
  describe '#takeoff' do
    it 'raises an error when weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      subject.land(Plane.new)
      expect { subject.takeoff }.to raise_error 'Weather is Stormy'
    end
  end
end
