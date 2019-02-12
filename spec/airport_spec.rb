require "airport"
require "plane"

describe Airport do
  let(:plane) {:plane}
  it 'should take a plane and add it to the hangar' do
    expect(subject.land_plane(plane)).to eq [plane]
  end

  describe '#takeoff_plane' do
    it 'should take off a plane and remove it from hanger' do
      subject.land_plane(plane)
      expect(subject.takeoff_plane(plane)).to eq plane
    end
  end

end
