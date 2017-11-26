require 'airport.rb'
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {Plane.new}
  describe 'capacity' do
    it "should have a variable capacity" do
      twentyAirport = Airport.new(20)
      weather = double(:weather, stormy: false)
      20.times {twentyAirport.land(plane, weather)}
      expect {twentyAirport.land plane}.to raise_error "Airport full"
    end
  end

  describe '#land' do
    it "adds a plane to the airport when weather isn't stormy" do
      weather = double(:weather, stormy: false)
      subject.land(plane, weather)
      expect(subject.planes.include?(plane)).to eq true
    end
    it "doesn't add a plane to the airport when weather is stormy" do
      weather = double(:weather, stormy: true)
      subject.land(plane, weather)
      expect(subject.planes.include?(plane)).to eq false
    end
  end

  describe '#take_off' do
    it "removes a plane from the airport when weather isn't stormy" do
      weather = double(:weather, stormy: false)
      subject.planes << plane
      subject.take_off(plane, weather)
      expect(subject.planes.include?(plane)).to eq false
    end
    it "doesn't remove plane from airport when weather is stormy" do
      weather = double(:weather, stormy: true)
      subject.planes << plane
      subject.take_off(plane, weather)
      expect(subject.planes.include?(plane)).to eq true
    end
  end
end
