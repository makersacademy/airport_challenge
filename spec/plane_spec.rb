require 'plane'

describe Plane do
  context 'initializing' do
    it { is_expected.to be_instance_of Plane }

    it 'returns a flying status when initialized' do
      expect(subject.flying?).to be true
    end
  end

  it 'cannot land when already in airport' do 
    subject.land_plane
    expect { subject.land_plane }.to raise_error PlaneLandedError
  end

  it 'can take off and change status to flying' do
    subject.land_plane
    subject.takeoff_plane
    expect(subject.flying?).to be true
  end

  it 'cannot take off when already flying' do
    expect { subject.takeoff_plane }.to raise_error PlaneTakeoffError
  end
end
