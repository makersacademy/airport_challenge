require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land_a_plane).with(1).argument }

  it { is_expected.to respond_to :take_off_plane }

  describe '#take_off_plane' do
    it 'takes off a plane that landed' do
      plane = Plane.new
      subject.land_a_plane(plane)
      expect(subject.take_off_plane).to eq plane
    end
  end

  describe '#take_off_plane' do
    it 'raises an error when there are no planes available' do
      expect { subject.take_off_plane }.to raise_error 'Unable to take off: no planes available'
    end
  end

  it { is_expected.to respond_to(:plane) }

  describe '#plane' do
    it 'returns landed planes' do
      plane = Plane.new
      subject.land_a_plane(plane)
      expect(subject.plane).to eq plane
    end
  end

  describe '#plane' do
    it 'confirms plane no longer in airport after take-off' do
      plane = Plane.new
      subject.land_a_plane(plane)
      subject.take_off_plane
      expect(subject.plane).to eq nil
    end
  end
  
end
