require 'services/plane_management_service'

describe PlaneManagementService do
  let(:plane1) { double :plane1, name: "fake plane 1", id: 123, status: :JFK, class: Aeroplane }
  let(:plane2) { double :plane1, name: "fake plane 2", id: 123, status: :JFK, class: Aeroplane }
  let(:flying_plane1) { double :flying_plane1, name: "flying plane 1", id: 123, status: :flying, class: Aeroplane }
  let(:flying_plane2) { double :flying_plane2, name: "flying plane 2", id: 123, status: :flying, class: Aeroplane }

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

  describe '#find_planes_at_airport' do
    it 'returns list of airports' do
      subject.add_plane(plane1)
      subject.add_plane(plane2)
      expect(subject.find_planes_by_airport(:JFK)).to eq [plane1, plane2]
    end
  end

  describe '#find_flying_planes' do
    it 'returns list of planes that are currently flying' do
      subject.add_plane(flying_plane1)
      subject.add_plane(flying_plane2)
      expect(subject.find_flying_planes).to eq [flying_plane1, flying_plane2]
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
