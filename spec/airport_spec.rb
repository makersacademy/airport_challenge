require 'airport'

describe Airport do
  let(:flying_plane) { instance_double("Plane", land: self) }

  it 'stores planes' do
    expect(subject).to respond_to(:planes)
  end

  describe '#land_plane' do

    it 'allows a plane to land' do
      plane.land(subject)
      expect(subject.planes).to include plane
    end
  end


end
