require './lib/airport'
require './lib/plane'

describe Airport do
  attr_reader :plane
  it { should respond_to :takeoff }
  it { should respond_to(:land).with(1).argument }

  describe '#takeoff' do
    it "Takes off a plane" do
      plane = subject.takeoff
    end
    it "prevents a plane from taking off during a storm" do
      airport = Airport.new
      airport.stub(:weather_rand).and_return(5)
      expect(lambda { airport.takeoff }).to raise_error "It is too stormy to take off!"
    end
    it "prevents a plane from taking off if the airport is empty" do
      expect { airport.takeoff }.to raise_error "Airport empty" if @planes.empty?
    end
  end

  describe '#land' do
    it "lands a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane landed."
    end
    it "prevents a plane from landing during a storm" do
      airport = Airport.new [plane]
      allow(:weather_rand).to receive(5)
      expect(lambda { subject.land(plane) }).to raise_error "It is too stormy to land!"
    end
    it "prevents the plane from landing if the airport is full" do
      5.times { subject.land Plane.new }
      plane.stub(:land).and_return(5)
      expect { plane.land Plane.new }.to raise_error "Can't land, airport is full."
    end
  end
end
