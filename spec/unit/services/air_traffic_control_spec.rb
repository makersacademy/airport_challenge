require 'services/air_traffic_control'
require 'domain/status_codes'

describe AirTrafficControl do
  let(:plane1) { double :plane1, name: "747", id: :AAAA, status: :JFK }
  let(:plane2) { double :plane2, id: :BBBB, status: :landed }
  let(:airport1) { double :airport1, name: "John F Kennedy", id: 111, code: :JFK }
  let(:airport2) { double :airport1, id: 222, code: :LHR }
  let(:plane_management_service) { double :plane_management_service }
  let(:airport_management_service) { double :airport_management_service }
  let(:weather_service) { double :weather_service }
  let(:subject) {
    described_class.new(
      plane_management_service,
      airport_management_service,
      weather_service)
  }
  describe '#add_plane' do
    it 'puts aeroplanes under the management of Air Traffic Control' do
      expect(plane_management_service).to receive(:add_plane).with(plane1).and_return(:ok)
      expect(subject.add_plane(plane1)).to eq :ok
    end
  end

  describe '#add_airport' do
    it 'puts airports under the management of Air Traffic Control' do
      expect(airport_management_service).to receive(:add_airport).with(airport1).and_return(:ok)
      expect(subject.add_airport(airport1)).to eq :ok
    end
  end

  describe '#clear_for_take_off' do
    context 'plane is at an airport' do
      it 'clears a flight for take-off' do
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(plane_management_service).to receive(:update_plane_status).with(plane1.id, :take_off)
        expect(airport_management_service).to receive(:prepare_for_take_off).with(plane1.status, plane1.id).and_return(:ok)
        expect(weather_service).to receive(:weather_report).and_return(:clear)
        subject.clear_for_take_off(:AAAA)
      end

      it 'landing not cleared due to bad weather' do
        expected = "plane #{plane1.id} (#{plane1.name}) deplayed take-off due to bad weather at John F Kennedy"
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(airport_management_service).to receive(:find_airport_by_code).with(plane1.status).and_return(airport1)
        expect(weather_service).to receive(:weather_report).and_return(:storm)
        expect(subject.clear_for_take_off(:AAAA)).to eq expected
      end
    end

    context 'plane is flying' do
      it 'throws an error because the plane is not at an airport' do
        allow(plane1).to receive(:status).and_return(:flying)
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(airport_management_service).not_to receive(:prepare_for_take_off)
        expect(weather_service).not_to receive(:weather_report)
        expect { subject.clear_for_take_off(:AAAA) }.to raise_error(PlaneNotAtAirportError)
      end
    end
  end

  describe '#take_off' do
    it 'requests the plane to take-off' do
      expect(plane_management_service).to receive(:update_plane_status).with(plane1.id, :flying)
      expect(airport_management_service).to receive(:take_off).with(airport1.code, plane1.id)
      subject.take_off(airport1.code, plane1.id)
    end
  end

  describe '#clear_for_landing' do

    context 'plane is flying' do
      it 'clears a plane for landing' do
        allow(plane1).to receive(:status).and_return(:flying)
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(plane_management_service).to receive(:update_plane_status).with(plane1.id, :landing)
        expect(airport_management_service).to receive(:prepare_for_landing).with(plane1.status, plane1.id).and_return(:ok)
        expect(weather_service).to receive(:weather_report).and_return(:clear)
        subject.clear_for_landing(:AAAA)
      end

      it 'take-off not cleared due to bad weather' do
        allow(plane1).to receive(:status).and_return(:flying)
        expected = "plane AAAA (747) delayed landing due to bad weather at John F Kennedy"
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(airport_management_service).to receive(:find_airport_by_code).with(plane1.status).and_return(airport1)
        expect(weather_service).to receive(:weather_report).and_return(:storm)
        expect(subject.clear_for_landing(:AAAA)).to eq expected
      end
    end

    context 'plane is at an airport' do
      it 'throws an error because the plane is not flying' do
        allow(plane1).to receive(:status).and_return(:JFK)
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(plane_management_service).not_to receive(:update_plane_status)
        expect(airport_management_service).not_to receive(:prepare_for_landing)
        expect(weather_service).not_to receive(:weather_report)
        expect { subject.clear_for_landing(:AAAA) }.to raise_error(PlaneNotFlyingError)
      end
    end
  end
end
