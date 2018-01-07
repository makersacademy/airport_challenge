require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'stores plane when it lands' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq(plane)
    end

  end

end
