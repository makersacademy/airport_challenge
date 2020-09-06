require 'airport'

describe Airport do
  
  describe '#land' do
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error when airport is full' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect{ subject.land(plane) }.to raise_error "Landing is not currently possible"
    end

  end
  
end



