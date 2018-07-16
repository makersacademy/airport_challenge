require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe '#launch' do


    it 'so planes launch from airport, instruct plane to launch' do
      Weather.new.stormy? == false
      plane = Plane.new
      airport.land(plane)
      expect(airport.launch(plane)).to eq plane
    end

#    it 'raises and error when stormy' do
#      weather = Weather.new
#      plane = Plane.new
#      airport.land(plane)
#      Weather.new.stormy?
#      expect { airport.launch(plane) }.to raise_error 'There is a storm, cannot launch plane'
#    end

    it 'raises an error when there are no planes available' do
      plane = Plane.new
      expect { airport.launch(plane) }.to raise_error 'Airport is empty'
    end
  end

  describe '#land' do
    it 'shows planes in airport' do
      expect(airport).to respond_to :planes
    end

    it 'so plane lands at airport, instructs a plane to land' do
      plane = Plane.new
#      Weather.new.stormy? == false
      expect { airport.land(plane) }.not_to raise_error
    end

    it 'raises an error when full' do
      Weather.new.stormy? == false
      airport.capacity.times { subject.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Cannot land plane: Airport full'
    end

    it 'raises and error when stormy' do
#      Weather.new.stormy? == true
#      expect { airport.land(Plane.new) }.to raise_error 'There is a storm, cannot land plane'
    end
  end
end
