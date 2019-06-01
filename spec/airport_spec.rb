require 'airport'

describe Airport do
#	 it { is_expected.to respond_to :land_plane }
  describe '#land_planes' do 
    it 'lands a plane' do
      planes = Planes.new
      subject.apron(planes)
      expect(subject.land_plane).to eq planes
#      expect(subject.land_plane(planes)).to eq planes
    end
  end

  it { is_expected.to respond_to(:apron).with(1).argument }
#	 it { is_expected.to respond_to(:planes) }
  it 'returns planes on apron' do 
    planes = Planes.new
    subject.apron(planes)
    expect(subject.planes).to eq planes
  end
end
