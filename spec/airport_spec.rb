require 'airport'

describe Airport do
  let(:flying_plane) { double :plane }

  before(:each) do
    allow(flying_plane).to receive(:land)
  end

  context 'landing of a plane' do
    it 'can land a plane' do
      subject.land(flying_plane)
    end

    it 'confirms the plane has landed' do
      subject.land(flying_plane)
      message = "The plane #{flying_plane.object_id} has landed."
      expect(subject.confirm(flying_plane)).to eq message
    end
  end
end
