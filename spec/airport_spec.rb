require 'airport'

describe 'airport' do
  describe '#land' do
    it 'tests whether an instance of plane responds to land method' do
      expect(Airport.new).to respond_to :land
    end

    it 'tests whether a landed plan has been added to the array' do
      plane1 = Plane.new
      heathrow = Airport.new
      heathrow.land(plane1)
      expect(heathrow.planes_landed).to include(plane1)
    end

    it 'raises an error if a plane tries to land and the airport is full' do
      logan = Airport.new
      Airport::DEFAULT_CAPACITY.times { logan.land(Plane.new) }
      expect { logan.land(Plane.new) }.to raise_error 'Airport is full.'
    end
  end

  describe '#landed?' do
    Airport.new.land(Plane.new)
    it 'tests whether plane responds to :landed?' do
      expect(Airport.new).to respond_to :landed?
    end
  end

  describe 'take_off' do
    it 'tests whether the plane responds to :take_off' do
      weather = Weather.new
      allow(weather).to receive(:stormy?).and_return(true)
      expect(Airport.new).to respond_to :take_off
    end

    # it 'moves the plane from the landed array to the in air array' do
    #   weather = Weather.new
    #   allow(weather).to receive(:stormy?).and_return(false)
    #   Airport.new.take_off(Plane.new)
    #   expect(Airport.new.planes_in_air).to include(Plane.new)
    # end
    #
    # it 'raises an error if the plane tries to take off in stormy weather' do
    #   weather = Weather.new
    #   allow(weather).to receive(:stormy?).and_return(true)
    #   expect { Airport.new.take_off(Plane.new) }.to raise_error 'Weather is stormy'
    # end
    end

end
