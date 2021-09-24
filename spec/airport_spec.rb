require 'domain/airport'

describe Airport do
  let(:plane1) { double :plane1, name: "fake plane 1", id: 123, "id=": 123, class: Aeroplane }
  let(:plane2) { double :plane2, name: "fake plane 2", id: 456, "id=": 456, class: Aeroplane }
  let(:weather_service) { double :weather_service, weather_report: :clear }
  let(:not_a_plane) { double :not_a_plane }
  let(:subject) { described_class.new(weather_service, 10) }

  describe '#land_plane' do
    it 'instructs a plane to land' do
      expect(subject.land_plane(plane1)).to eq(:ok)
      expect(subject.view_planes_at_terminal).to include plane1.id
    end

    it 'stops a plane landing when airport is full' do
      airport = Airport.new(weather_service, 1)
      airport.land_plane(plane1)
      expect(airport.land_plane(plane2)).to eq("cannot land #{plane2.name}: Airport is full")
    end

    it 'stops a plane landing when there is a storm' do
      expect(weather_service).to receive(:weather_report).and_return :storm
      expect(subject.land_plane(plane1)).to eq("cannot land #{plane1.name}: Bad weather")
    end

    it 'throws error on landing if object is not a plane' do
      expect { subject.land_plane(not_a_plane) }.to raise_error(NotAPlaneError)
    end
  end

  describe '#take_off' do
    it 'instruct a plane to take off' do
      subject.land_plane(plane1)
      expect(subject.take_off(plane1)).to eq :ok
      expect(subject.view_planes_at_terminal).not_to include plane1.id
    end

    it 'stops a plane taking off when there is a storm' do
      subject.land_plane(plane1)
      expect(weather_service).to receive(:weather_report).and_return :storm
      expect(subject.take_off(plane1)).to eq("#{plane1} cannot take-off: Bad weather")
    end
    
    it 'throws error on take-off if object is not a plane' do
      expect { subject.take_off(not_a_plane) }.to raise_error(NotAPlaneError)
    end
  end

  describe '#view_planes_at_terminal' do
    it 'returns the ids of all planes currently at the airport' do
      subject.land_plane(plane1)
      subject.land_plane(plane2)
      expect(subject.view_planes_at_terminal).to include(plane1.id, plane2.id) 
    end
  end
end
