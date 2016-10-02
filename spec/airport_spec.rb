require 'airport'

describe Airport do
  let(:airport) { Airport.new}
  let(:weather) { Weather.new}

  before :example do
    @plane = Plane.new
  end

  describe 'Control centre' do

    it 'instructs a plane to land at an airport' do
      expect(subject.land(@plane)).to eq [@plane]
    end

    it 'confirms that a plane has landed' do
      subject.land(@plane)
      expect(subject.planes).to eq [@plane]
    end

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'confirms that a plane has took off' do
      subject.land(@plane)
      expect(subject.take_off).to eq @plane
    end

    it 'checks the actual_weather' do

      expect(airport.actual_weather(weather)).to eq airport.stormy_weather
    end

    describe 'prevents' do

      it 'take off in stormy weather' do
        subject.land(@plane)
        subject.actual_weather(weather)
        expect(subject.take_off).to eq 'No take off due to storm'
      end

      it 'landing in stormy weather' do
        subject.actual_weather(weather)
        expect(subject.land(@plane)).to eq 'No landing due to storm'
      end

      it 'landing when airport is full' do
        expect{(airport.capacity + 1).times {airport.land(@plane) }}.to raise_error('Airport is full')
      end
    end
  end

  describe 'System designer' do
    it 'can change the default capacity' do
      expect(Airport.new(60).capacity).to eq 60
    end
  end

end
