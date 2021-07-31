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

    context 'weather is unsafe' do

      it do
        stormy = double('Stormy')
        allow(stormy).to receive_messages(safe: false)
        expect { subject.land(Plane.new, stormy) }.to raise_error("Unsafe weather conditions")
      end

    end

  end

end
