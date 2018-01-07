require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'confirms plane has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq(plane)
    end
  end
end
