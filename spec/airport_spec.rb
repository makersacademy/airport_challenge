require 'airport'

describe Airport do
  describe '#land' do
    it 'raises an error if airport it full' do
      subject.airport_capacity.times { subject.land(Plane.new) }
      plane = Plane.new
      expect {raise subject.land(plane)}.to raise_error('The airport is full')
    end
    it 'instructs a plane to land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to be
    end

    it 'confirms that plane is no longer at airport'do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "#{plane} has taken off"
    end
  end

  describe '#weather' do
    it 'decides if weather is stormy or sunny' do
      expect(subject).to respond_to(:weather)
    end
    
    it 'is stormy when number is 3' do
      allow(subject).to receive(:rand).and_return(3) 
      expect(subject.weather).to eq 3
    end
    it 'is sunny when number is 0..2' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.weather).to eq 1
    end
  end

end