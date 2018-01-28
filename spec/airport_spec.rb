require "airport"
require "plane"
require "weather"

describe Airport do
  airport = Airport.new
    it "expect planes to be empty" do
      expect(airport.planes).to eq []
      end
    end


describe "Land plane" do
  airport = Airport.new
  plane = Plane.new
    it "should allow a plane to land" do
      expect(airport.land(plane)).to eq [plane]
      end
    end

    describe "Plane take off" do
      airport = Airport.new
      plane = Plane.new
      it "should allow a plane to take off and confirm take off" do
        airport.land(plane)
      expect(airport.take_off(plane)).to eq "Plane take off"
    end
  end

describe "Full airport" do
  airport = Airport.new
  plane = Plane.new
  it 'raises an error when airport is full' do
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end
end

describe "Airport empty" do
airport = Airport.new
plane = Plane.new
it 'raises an error when airport is empty' do
  expect { airport.take_off(plane) }.to raise_error 'Airport is empty'
  end
end




  # describe "Cant land its stormy" do
  # airport = Airport.new
  # plane = Plane.new
  # weather = Weather.new
  # it "doesn't allow planes to land" do
  #   airport.weather = stormy?
  #       expect { airport.land(plane) }.to raise_error "Too stormy to land"
  #     end
  #   end
