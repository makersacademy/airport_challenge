require 'airport'

describe Airport do
  let(:flying_plane) { double :plane }
  let(:parked_plane) { double :plane }

  before(:each) do
    allow(flying_plane).to receive(:land).and_return(flying_plane)
    allow(flying_plane).to receive(:landed?).and_return(:true)
    allow(parked_plane).to receive(:take_off)
    allow(parked_plane).to receive(:landed?).and_return(:false)
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
