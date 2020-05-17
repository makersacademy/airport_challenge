require_relative '../lib/plane'

describe Plane do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :take_off }

  it 'should check if it is in flight before taking off' do
    plane.land_plane
    expect(plane.flying?).to eq false
  end

  describe '#take_off' do
    it 'should raise error if plane is in flight' do
      expect { plane.take_off }.to raise_error('Cannot take off: already in flight')
    end

    it 'should allow a plane to take off if not in flight' do
      plane.land_plane
      expect(plane.take_off).to eq true
    end
  end

end
