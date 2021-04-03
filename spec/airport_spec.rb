require 'airport'
describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq plane
  end 

  it 'confirms the plane is no longer in the airport' do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect(subject.include?(plane)).to be false
  end 

  it 'confirms the planes are in the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.include?(plane)).to be true
  end 
  
  describe '#land' do
    it 'raises an error when the airport is full so planes cannot land' do
      Airport::DEFAULT_CAPACITY.times { subject.land Plane.new }
      expect { subject.land Plane.new }. to raise_error 'Airport full, do not land'
    end 
    it 'lands planes' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end 
  end 
end 
