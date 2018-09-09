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
  end

  describe '#land' do
    it "lands a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane landed."
    end
    it "prevents a plane from landing during a storm" do
      airport = Airport.new
      airport.stub(:weather_rand).and_return(5)
      expect(lambda { airport.land(plane) }).to raise_error "It is too stormy to land!"
    end
  end
end
