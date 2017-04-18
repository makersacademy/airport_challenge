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

    it 'raises an error if a plane on the ground tries to land' do
      detroit = Airport.new
      plane2 = Plane.new
      detroit.land(plane2)
      expect { detroit.land(plane2) }.to raise_error 'Plane already landed.'
    end
  end

  describe '#landed?' do
    Airport.new.land(Plane.new)
    it 'tests whether plane responds to :landed?' do
      expect(Airport.new).to respond_to :landed?
    end
  end

  describe 'take_off' do

    it 'moves the plane from the landed array to the in air array' do
      weather = Weather.new
      stansted = Airport.new
      spirit = Plane.new
      allow(weather).to receive(:stormy).and_return(false)
      stansted.take_off(spirit)
      expect(stansted.planes_in_air).to include(spirit)
    end

    it 'raises an error if a flying plane tries to take off' do
      plane3 = Plane.new
      knock = Airport.new
      knock.take_off(plane3)
      expect { knock.take_off(plane3) }.to raise_error 'Plane already in flight.'
    end

    # it 'raises an error if the plane tries to take off in stormy weather' do
    #   gatwick = Airport.new
    #   report = Weather.new
    #   allow(report).to receive(:number) { 0 }
    #   expect { gatwick.take_off(Plane.new) }.to raise_error 'Weather is stormy'
    # end
  end

end
