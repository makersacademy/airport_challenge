require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:flying => true, set_flying: self, set_landed: self)}
  let(:another_plane) {double(:flying => true, set_flying: self, set_landed: self)}
  let(:landed_plane) {double(:flying => false)}

  before(:each) do
    sunny_weather = instance_double("Weather", :condition => :sunny)
    subject.set_weather(sunny_weather)
  end

  describe '#initialize' do

    it 'can be initialized with a capacity argument' do
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30
    end

  end

  context 'when landing and taking off planes' do

    before(:each) do
      subject.land(plane)
      subject.land(another_plane)
    end

    it 'lands a Plane and returns the same Plane' do
      expect(subject.planes.shift).to eq plane
    end

    it 'can land more than one plane' do
      subject.land(another_plane)
      expect(subject.planes).to include(plane, another_plane)
    end

    it 'can take off a plane' do
      allow(plane).to receive(:flying).and_return false
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

  end

  context '#weather' do

    it 'contains a Weather object' do
      subject.set_weather(Weather.new)
      expect(subject.weather).to be_kind_of Weather
    end

    it 'can overwrite its weather attribute' do
      weather = instance_double("Weather")
      subject.set_weather(weather)
      expect(subject.weather).to eq weather
    end

  end

  describe "error handling" do

    context 'when there is stormy weather' do

      before(:each) do
        stormy_weather = instance_double("Weather", :condition => :stormy)
        subject.set_weather(stormy_weather)
      end

      it 'does not allow Planes to take off' do
        subject.planes << plane
        message = 'Planes cannot take off while it is stormy'
        expect { subject.take_off(plane) }.to raise_error(RuntimeError, message)
      end

      it 'does not allow Planes to land' do
        message = 'Planes cannot land while it is stormy'
        expect { subject.land(plane) }.to raise_error(RuntimeError, message)
      end

    end

    context 'when it is sunny' do

    end

    describe 'when the airport is at capacity' do

      it 'does not allow planes to land when the airport is at capacity' do
        message = 'Planes cannot land at this airport, it is full'
        Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error(RuntimeError, message)
      end

      it 'does not allow planes to land at an airport at custom capacity' do
        message = 'Planes cannot land at this airport, it is full'
        subject = Airport.new(15)
        sunny_weather = instance_double("Weather", :condition => :sunny)
        subject.set_weather(sunny_weather)
        15.times { subject.land(plane) }
        expect{ subject.land(plane) }.to raise_error(RuntimeError, message)
      end

    end

    context 'when there are inconsistent behaviours' do

      it 'only lets planes take off from airports they\'re in' do
        message = 'This plane can\'t take off from here. It hasn\'t landed here.'
        expect{ subject.take_off(plane) }.to raise_error(RuntimeError, message)
      end

      it 'doesn\'t let planes that have landed land again' do
        message = 'That plane cannot land. It has already landed.'
        expect{ subject.land(landed_plane) }.to raise_error(RuntimeError, message)
      end

      it 'doesn\'t let planes that are flying take off' do
        message = 'This plane can\'t take off because it is already flying'
        subject.planes << plane
        expect{ subject.take_off(plane) }.to raise_error(RuntimeError, message)
      end

    end
  end
end
