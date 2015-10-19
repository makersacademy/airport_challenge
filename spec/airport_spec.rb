require 'airport'

describe Airport do
  
  let(:subject) { Airport.new('airport') }

  describe 'inititialization' do
    it 'is created with a name' do
      expect(subject.name).to eq 'airport'
    end

    it 'can contain planes' do
      expect(subject.planes.class==Array).to be true
    end

    it {is_expected.to respond_to (:capacity) }

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    let(:larger_airport) { Airport.new('airport',100) }
    it 'can have a different capacity when created' do
      expect(larger_airport.capacity).to eq 100
    end
  end

  describe '#full' do
    it {is_expected.to respond_to (:full) }

    it 'is full when it has reached capacity' do
      Airport::DEFAULT_CAPACITY.times do 
        plane=Plane.new
        plane.complete_landing(subject)
      end
      expect(subject.full).to eq true
    end
  end

  describe '#weather' do
    it 'is expected to be sunny or stormy' do
      weather_options=[:sunny, :stormy]
      expect((weather_options).include?(subject.weather)).to be true
    end
  end


end