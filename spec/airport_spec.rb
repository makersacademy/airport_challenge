require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'stores plane when it lands' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'stores more than one plane that lands' do
      plane = Plane.new
      plane2 = Plane.new
      subject.land(plane)
      subject.land(plane2)
      expect(subject.planes).to eq([plane, plane2])
    end

  end

  describe '#take_off' do
    it 'takes off plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq []
    end
  end

end
