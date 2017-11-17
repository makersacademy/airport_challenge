require 'airport'

describe Airport do
  let(:flying_plane) { double :plane }
  let(:parked_plane) { double :plane }

  before(:each) do
    allow(flying_plane).to receive(:land).and_return(flying_plane)
    allow(flying_plane).to receive(:landed?).and_return(true)
    allow(parked_plane).to receive(:take_off).and_return(parked_plane)
    allow(parked_plane).to receive(:landed?).and_return(false)
  end

  context 'when landing of a plane' do
    it 'lands a plane' do
      subject.land(flying_plane)
      expect(flying_plane).to be_landed
    end
  end

  context 'in take-off procedure' do
    it 'gives the plane instructions to take off' do
      subject.land(flying_plane)
      expect(subject.take_off(parked_plane)).not_to be_landed
    end
  end
end
