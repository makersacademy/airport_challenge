require 'airport'

describe Airport do
#	 it { is_expected.to respond_to :land_plane }
  describe '#land_planes' do 
    it 'lands a plane' do
      planes = Planes.new
      subject.apron(planes)
      expect(subject.land_plane).to eq planes
    end
  end

#  it { is_expected.to respond_to(:apron).with(1).argument }
#	 it { is_expected.to respond_to(:planes) }
  describe '#apron' do
    it 'returns planes to apron' do 
      planes = Planes.new
      subject.apron(planes)
      expect(subject.planes).to eq planes
    end
    
    it 'raises an error when airport full' do
      subject.apron(Planes.new)
      expect { subject.apron Planes.new}.to raise_error 'Airport is full'
    end
  end

end
