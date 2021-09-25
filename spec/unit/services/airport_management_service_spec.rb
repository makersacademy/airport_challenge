require 'services/airport_management_service'
require 'errors/not_an_airport_error'
require 'domain/airport'

describe AirportManagementService do
  let(:plane1) { double :plane1, name: "747", id: :AAAA, status: :JFK }
  let(:airport1) { double :airport1, id: 111, code: :JFK, class: Airport }
  let(:airport2) { double :airport1, id: 111, code: :LHR, class: Airport }
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

  describe '#prepare_for_take_off' do
    context 'airport is managed by atc' do
      it 'tells airport to prepare for take-off' do
        subject.add_airport(airport1)
        expect(airport1).to receive(:prepare_for_take_off).with(plane1.id)
        subject.prepare_for_take_off(airport1.code, plane1.id)
      end
    end

    context 'airport is not recognised' do
      it 'errors with unrecognised aiport code' do
        expect(airport1).not_to receive(:prepare_for_take_off).with(plane1.id)
        expect { subject.prepare_for_take_off(airport1.code, plane1.id) }.to raise_error(NotAnAirportError)
      end
    end
  end

  describe '#take_off' do
    context 'airport is managed by atc' do
      it 'tells the airport to let the plane take off' do
        subject.add_airport(airport1)
        expect(airport1).to receive(:take_off)
        subject.take_off(airport1.code)
      end
    end

    context 'airport is not recognised' do
      it 'errors with unrecognised aiport code' do
        expect(airport1).not_to receive(:prepare_for_take_off)
        expect { subject.take_off(airport1.code) }.to raise_error(NotAnAirportError)
      end
    end
  end

  describe '#prepare_for_landing' do
    context 'airport is managed by atc' do
      it 'tells airport to prepare for landing' do
        subject.add_airport(airport1)
        expect(airport1).to receive(:prepare_for_landing).with(plane1.id)
        subject.prepare_for_landing(airport1.code, plane1.id)
      end
    end

    context 'airport is not recognised' do
      it 'errors with unrecognised aiport code' do
        expect(airport1).not_to receive(:prepare_for_landing)
        expect { subject.prepare_for_landing(airport1.code, plane1.id) }.to raise_error(NotAnAirportError)
      end
    end
  end

  describe '#land' do
    context 'airport is managed by atc' do
      it 'tells the airport to land the plane' do
        subject.add_airport(airport1)
        expect(airport1).to receive(:land)
        subject.land(airport1.code)
      end
    end

    context 'airport is not recognised' do
      it 'errors with unrecognised aiport code' do
        expect(airport1).not_to receive(:land)
        expect { subject.land(airport1.code) }.to raise_error(NotAnAirportError)
      end
    end
  end
end
