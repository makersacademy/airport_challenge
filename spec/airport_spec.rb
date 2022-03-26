require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }    
  
  describe '# landing' do
    
    it 'the planes' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(subject.plane)
    end
    
    it 'has a Default capcity' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it '--to be prevented when airport is full' do 
    Airport::DEFAULT_CAPACITY.times { subject.land Plane.new }
    expect {subject.land Plane.new }.to raise_error 'Airport is full no landing allowed'
    end
  end
  
  describe '#take-offs' do

    it 'lets planes to take - off' do
      plane = Plane.new
      p1 = Plane.new
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq(plane)
    end

    it 'checks if the planes has taken - off' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane.taken_off?).to be true
    end  
  end    
end
