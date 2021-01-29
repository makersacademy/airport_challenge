require 'airport'

describe Airport do
  describe '#land' do
    it 'raises an error if airport it full' do
      plane = Plane.new
      plane2 = Plane.new
      subject.land(plane2)
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

end