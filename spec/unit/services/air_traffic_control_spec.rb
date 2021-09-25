require 'services/air_traffic_control'

describe AirTrafficControl do
  let(:plane1) { double :plane1, id: 123, status: :flying}
  let(:plane2) { double :plane2, id: 456, status: :landed }
  let(:airport1) { double :airport1, id:111, code: :JFK}
  let(:airport2) { double :airport1, id:222, code: :LHR}
  describe '#add_plane' do
    it 'puts aeroplanes under the management of Air Traffic Control' do
      subject.add_plane(plane1)
      subject.add_plane(plane2)
      expect(subject.planes).to include(plane1, plane2)
    end
  end

  describe '#add_airport' do
    it 'puts airports under the management of Air Traffic Control' do
      subject.add_airport(airport1)
      subject.add_airport(airport2)
      expect(subject.airports).to include(airport1, airport2)
      expect(subject.status_codes).to include(airport1.code)
    end
  end

  describe '#find_airport_by_id' do
    it 'will find the details of a specific airport' do
      subject.add_airport(airport1)
      expect(subject.find_airport_by_id(111)).to eq airport1
    end
  end

  describe '#find_airport_by_code' do
    it 'will find the details of a specific airport' do
      subject.add_airport(airport1)
      expect(subject.find_airport_by_code(:JFK)).to eq airport1
    end
  end

  describe '#find_plane_by_id' do
    it 'will find the details of a specific plane' do
      subject.add_plane(plane1)
      expect(subject.find_plane_by_id(123)).to eq plane1
    end
  end
  
  describe '#get_plane_status' do
    it 'will find the status for a plane' do
      subject.add_plane(plane1)
      expect(subject.get_plane_status(123)).to eq :flying
    end
  end
end