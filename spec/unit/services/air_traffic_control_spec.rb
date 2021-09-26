require 'services/air_traffic_control'
require 'domain/airport_status_codes'

describe AirTrafficControl do
  let(:plane1) { double :plane1, name: "747", id: :AAAA, status: :JFK }
  let(:airport1) { double :airport1, airport_name: "John F Kennedy", id: 111, code: :JFK }
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
        expected = "Plane #{plane1.id} (#{plane1.name}) deplayed take-off due to bad weather at John F Kennedy"
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
    context 'skipped clearance for take-off' do
      it 'requests the plane to take-off' do
        expect(plane_management_service)
          .to receive(:update_plane_status)
          .with(plane1.id, :flying)
        expect(airport_management_service)
          .to receive(:take_off)
          .with(airport1.code)
          .and_return(:ok)
        subject.take_off(airport1.code, plane1.id)
      end
    end
  
    context 'skipped clearance for take-off' do
      it 'returns no clearance given' do
        expect(airport_management_service)
          .to receive(:take_off)
          .with(airport1.code)
          .and_return("No planes cleared for take off")

        expect(plane_management_service)
          .not_to receive(:update_plane_status)
        subject.take_off(airport1.code, plane1.id)
      end
    end
  end

  describe '#clear_for_landing' do

    context 'when plane is flying,' do
      it 'clears a plane for landing' do
        allow(plane1).to receive(:status).and_return(:flying)
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(plane_management_service).to receive(:update_plane_status).with(plane1.id, :landing)
        expect(airport_management_service).to receive(:prepare_for_landing).with(:JFK, plane1.id).and_return(:ok)
        expect(weather_service).to receive(:weather_report).and_return(:clear)
        subject.clear_for_landing(:JFK, :AAAA)
      end

      it 'landing not cleared due to bad weather' do
        allow(plane1).to receive(:status).and_return(:flying)
        expected = "Plane AAAA (747) delayed landing due to bad weather at John F Kennedy"
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(airport_management_service).to receive(:find_airport_by_code).with(airport1.code).and_return(airport1)
        expect(weather_service).to receive(:weather_report).and_return(:storm)
        expect(subject.clear_for_landing(:JFK, :AAAA)).to eq expected
      end

      it 'landing not cleared due to full airport' do

        allow(plane1).to receive(:status).and_return(:flying)
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(weather_service).to receive(:weather_report).and_return(:clear)
        expect(airport_management_service).to receive(:prepare_for_landing).with(:JFK, plane1.id).and_return(:full)
        expect(plane_management_service).not_to receive(:update_plane_status)

        expected = "Error: #{AirportFullError::DEFAULT_MESSAGE}"
        expect(subject.clear_for_landing(:JFK, :AAAA)).to eq expected
      end
    end

    context 'plane is at an airport' do
      it 'throws an error because the plane is not flying' do
        allow(plane1).to receive(:status).and_return(:JFK)
        expect(plane_management_service).to receive(:find_plane_by_id).with(:AAAA).and_return(plane1)
        expect(plane_management_service).not_to receive(:update_plane_status)
        expect(airport_management_service).not_to receive(:prepare_for_landing)
        expect(weather_service).not_to receive(:weather_report)
        expect { subject.clear_for_landing(:JFK, :AAAA) }.to raise_error(PlaneNotFlyingError)
      end
    end
  end

  describe '#land' do
    context 'has clearance for landing' do
      it 'requests the plane to land' do
        expect(plane_management_service)
          .to receive(:update_plane_status)
          .with(plane1.id, airport1.code)

        expect(airport_management_service)
          .to receive(:land)
          .with(airport1.code)
          .and_return(:ok)

        subject.land(airport1.code, plane1.id)
      end
    end

    context 'skipped clearance for landing' do
      it 'returns no clearance given' do
        expect(airport_management_service)
          .to receive(:land)
          .with(airport1.code)
          .and_return("No planes cleared for landing")

        expect(plane_management_service)
          .not_to receive(:update_plane_status)
        subject.land(airport1.code, plane1.id)
      end
    end
  end
end
