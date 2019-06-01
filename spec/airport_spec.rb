require 'airport'

describe Airport do
#	 it { is_expected.to respond_to :land_plane }
  it 'lands a plane' do
    planes = Planes.new
    expect(subject.land_plane(planes)).to eq planes
  end

  it { is_expected.to respond_to(:apron).with(1).argument }
#	 it { is_expected.to respond_to(:planes) }
  it 'returns planes on apron' do 
    planes = Planes.new
    subject.apron(planes)
    expect(subject.planes).to eq planes
  end
end
