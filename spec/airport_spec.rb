require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }    
  
  describe '#lands' do
    
    it 'the planes' do
      plane = Plane.new
      expect(subject.land(plane)).to eq(subject.plane)
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
