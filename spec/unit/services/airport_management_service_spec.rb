require 'services/airport_management_service'
require 'errors/not_an_airport_error'

describe AirportManagementService do
  let(:airport1) { double :airport1, id: 111, code: :JFK, class: Airport }
  let(:airport2) { double :airport2, id: 222, code: :LHR, class: Airport }
  describe '#add_airport' do

    it 'adds a new airport' do
      subject.add_airport(airport1)
      expect(subject.find_airport_by_code(:JFK)).to eq airport1
    end

    it 'throws NotAirportError if object is not an Aeroplane' do
      expect { subject.add_airport("string") }.to raise_error(NotAnAirportError)
    end
  end

  describe '#find_airport_by_code' do
    it 'returns the plane for a given code' do
      subject.add_airport(airport1)
      subject.add_airport(airport2)
      expect(subject.find_airport_by_code(:LHR)).to eq airport2
    end

    it 'returns nil if no airport found' do
      subject.add_airport(airport1)
      expect(subject.find_airport_by_code("invalidID")).to eq nil
    end
  end
end
