require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands a plane' do
      plane = double('plane')
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#planes' do
    it 'reports the planes that are in the airport' do
      plane = double('plane')
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

end
