require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:send_to_hangar).with(1).argument }
  describe '#send_to_hangar' do
    it 'stores a plane in the hangar' do
      expect(subject.send_to_hangar(plane)).to eq plane
    end
  end
end
