require './lib/airport'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to be_instance_of(Airport) }
  
  describe '#land' do

    context 'weather is safe' do

      it 'planes can land at an airport' do
        nice_weather = double('nice weather')
        allow(nice_weather).to receive_messages(safe: true)

        subject.land(plane, nice_weather)
        expect(subject.planes).to eq [plane]
      end
    
      it 'returns an error if plane is parked elsewhere' do
        nice_weather = double('nice weather')
        allow(nice_weather).to receive_messages(safe: true)
        subject.land(plane, nice_weather)

        expect { Airport.new.land(plane, nice_weather) }.to raise_error("Plane already parked")
      end
    end

    context 'weather is unsafe' do

      it do
        stormy = double('Stormy')
        allow(stormy).to receive_messages(safe: false)
        expect { subject.land(Plane.new, stormy) }.to raise_error("Unsafe weather conditions")
      end

    end

  end

  describe '#take_off' do
    
    context 'weather is safe' do

      it 'after taking off that plane is no longer at that airport' do
        nice_weather = double('nice weather')
        allow(nice_weather).to receive_messages(safe: true)
        subject.land(plane, nice_weather)

        subject.take_off(plane, nice_weather)
        expect(subject.planes).not_to include(plane)
      end

      it 'returns and error if that plane is not parked here' do
        nice_weather = double('nice weather')
        allow(nice_weather).to receive_messages(safe: true)

        expect { subject.take_off(plane, nice_weather) }.to raise_error("Plane not parked here")
      end
      
    end

    context 'weather is unsafe' do
      
      it 'take_off is not allowed' do
        stormy = double('stormy')
        allow(stormy).to receive_messages(safe: false)

        expect { subject.take_off(plane, stormy) }.to raise_error("Unsafe weather conditions")
      end

    end

  end

  describe 'capacity' do
    
    it 'has a default capacity' do
      nice_weather = double('nice weather')
      allow(nice_weather).to receive_messages(safe: true)

      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new, nice_weather) }
      expect { subject.land(Plane.new, nice_weather) }.to raise_error("There is no space at this airport")
    end

    it 'has a variable capacity' do
      nice_weather = double('nice weather')
      allow(nice_weather).to receive_messages(safe: true)
      airport = Airport.new(30)

      30.times { airport.land(Plane.new, nice_weather) }
      expect { airport.land(Plane.new, nice_weather) }.to raise_error("There is no space at this airport")
    end

  end

end
