require 'airport'

describe Airport do
  # it 'reponds to land_plane' do
  #   expect(subject).to respond_to :land_plane
  # end

  describe '#land' do
    # it 'raises an error when airport is full' do
    #   plane = Plane.new
    #   expect { subject.land(plane) }.to raise_error 'Airport full'
    # end

    it 'lands a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end
  end
  
  # it { is_expected.to respond_to(:land).with(1).argument }

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