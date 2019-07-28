require 'airport'
describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }
  #it { is_expected.to respond_to(:weather) }
  it 'has a hangar capacity' do
    expect(subject.hangar).to eq Airport::DEFAULT_CAPACITY
  end
  describe 'initialization' do
    it 'has a variable hangar' do
   airport = Airport.new(20)
   20.times { airport.land Plane.new }
    expect{ airport.land Plane.new }.to raise_error 'Airport full'
    end
  end
  
  describe '#land' do
    it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    end
    it 'raises an error when full' do
    subject.hangar.times { subject.land(Plane.new) }
    expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end
    
    it Airport::DEFAULT_CAPACITY.times do
    subject.land Plane.new
    end
  end
  
  describe '#take_off' do
    it 'A plane takes off' do
      plane = Plane.new
      subject.land(plane)
      # a plane is taking off
      expect(subject.take_off).to eq plane
      expect { subject.take_off }.to raise_error 'No planes taking off'
    end
  end
end