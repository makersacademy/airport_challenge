require 'airport'

describe Airport do
  describe '#land' do
    it 'checks .land instructs a plane to land at airport' do
        airport = Airport.new 
        plane = Plane.new
        expect airport.land(plane) 
        expect(airport.hangar).to include (plane)
    end

    it 'checks .land prevents landing when airport is full' do
      airport = Airport.new
      plane = Plane.new
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Cannot land, airport full"
    end
    
  end

  describe '#take_off' do
    it 'checks .take_off instructs a plane to take off from an airport' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off(plane) }.not_to raise_error
    end
  end
  
  describe '#hangar' do
    # it "checks .hangar prevents landing when the airport is full" do
    #   airport = Airport.new
    #   plane = Plane.new
    #   20.times do
    #        @queue.push(plane)
    #    end
    #    expect { queue.push(plane) }.to raise_error "Cannot land, airport full"
    #  end
    end
end
