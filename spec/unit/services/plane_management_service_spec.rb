require 'services/plane_management_service'

describe PlaneManagementService do
  let(:plane1) { double :plane1, name: "fake plane 1", id: 123, status: :flying, class: Aeroplane }
  describe '#add_plane' do

    it 'adds a new plane' do
      subject.add_plane(plane1)
      expect(subject.find_plane_by_id(123)).to eq plane1
    end

    it 'throws NotAPlaneError if object is not an Aeroplane' do
      expect { subject.add_plane("string") }.to raise_error(NotAPlaneError)
    end
  end

  describe '#find_plane_by_id' do
    it 'returns the plane for a given ID' do
      subject.add_plane(plane1)
      expect(subject.find_plane_by_id(123)).to eq plane1
    end

    it 'returns nil if no plane found' do
      subject.add_plane(plane1)
      expect(subject.find_plane_by_id("invalidID")).to eq nil
    end
  end

  describe '#update_plane_status' do
    it 'requests the plane updates status' do
      subject.add_plane(plane1)
      expect(plane1).to receive(:update_status).with(:landing)
      subject.update_plane_status(123, :landing)
    end
  end

end
