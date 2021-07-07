require 'airport.rb'

#airport to allow a plane to land
RSpec.describe Airport do
  it "create a new instance of airport" do
    airport = Airport.new
  end

# the airport is full
  describe '#initialize' do
    it "varies aiport capacity" do
      airport = Airport.new(30)
      30.times { airport.landed Plane.new }
      expect { airport.landed Plane.new }.to raise_error "Not safe to land, airport is full!"
    end
    subject { Airport.new }
    let(:plane) { Plane.new }
    it "defaults airport capacity" do
      Airport::DEFAULT_CONSTANT.times do
        subject.landed(plane)
      end
      expect { subject.landed(plane) }.to raise_error "Not safe to land, airport is full!"
    end
  end


# plane has landed at the airport
  describe '#landed' do
    it "plane has arrived" do
      plane = Plane.new
      subject.landed(plane)
      expect{ subject.landed(:landed) }
      puts "Plane has landed"
    end
  end

# plane has taken off from the airport
  describe '#taken_off' do
    it "plane has departed" do
      plane = Plane.new
      subject.taken_off(plane)
      expect { subject.taken_off(:taken_off) }
      puts "Plane has departed"
    end
  end
end

#plane can't take off due to weather 
  it "is dependant on weather" do
    it "plane cannot take off" do

  end
