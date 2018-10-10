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
    expect(subject).to respond_to(:takeoff).with(1).argument
  end
  
  
  describe '#land' do
    let(:plane) { Plane.new }
    it 'check is plane is in airport' do
      subject.land(plane)
      expect(plane.location).to eq 'land'
    end
  end
  
  describe '#takeoff' do
    let(:plane) { Plane.new }
    it 'check if plane has left airport' do
      subject.land(plane)
      subject.takeoff(plane)
      allow(subject).to receive(:stormy?) { false }
      expect(plane.location).to eq 'sky'
    end
    
    it 'raises an error when weather is stormy' do
      allow(subject).to receive(:stormy?) { true }
      subject.land(plane)
      expect { subject.takeoff(plane) }.to raise_error 'Weather is Stormy'
    end
    
  end
end
