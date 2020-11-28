require 'airport'

describe Airport do
  describe 'full?' do
    it "raises an error if airport with default capacity is full" do
      Airport::DEFAULT_CAPACITY.times { Plane.new.land(subject) }
      expect { Plane.new.land(subject) }.to raise_error "This airport is full!"
    end

    it "raises an error if airport with variable capacity is full" do
      airport = Airport.new(5)
      5.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error "This airport is full!"
    end
  end
end