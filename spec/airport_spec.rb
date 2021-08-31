require 'airport'

describe Airport do

  describe '#land' do

    it 'lands a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end
  end

  it { is_expected.to respond_to(:plane)}
  
  it 'returns a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  it 'responds to take_off_plane' do
    expect(subject).to respond_to :take_off_plane
  end

end