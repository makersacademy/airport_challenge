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
  
  it 'check is plane is at airport' do
   subject.land(Plane.new)
  expect(subject.parked).to eq true
  end
  
end
