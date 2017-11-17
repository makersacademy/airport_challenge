require 'airport'

describe Airport do
  let(:flying_plane) { double :plane }
  let(:parked_plane) { double :plane }

  before(:each) do
    allow(flying_plane).to receive(:land)
    allow(flying_plane).to receive(:landed?).and_return(:true)

  end

  context 'when landing of a plane' do
    it 'lands a plane' do
      subject.land(flying_plane)
      expect(flying_plane).to be_landed
    end

    it 'confirms the plane has landed' do
      subject.land(flying_plane)
      message = "The plane #{flying_plane.object_id} has landed."
      expect(subject.confirm(flying_plane)).to eq message
    end
  end
end
