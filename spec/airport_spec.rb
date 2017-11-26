require 'airport.rb'
describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:clear_weather) { double(:weather, stormy: false) }
  let(:stormy_weather) { double(:weather, stormy: true) }

  describe 'capacity' do
    it "should have a variable capacity" do
      twenty_airport = Airport.new(20)
      20.times { twenty_airport.land(Plane.new, clear_weather) }
      expect { twenty_airport.land(plane, clear_weather) }.to raise_error "Airport full"
    end
  end

  describe '#land' do
    it "raises an error when the plane is already grounded" do
      subject.land(plane, clear_weather)
      expect { subject.land(plane, clear_weather) }.to raise_error "Plane is grounded"
    end
    it "adds a plane to the airport when weather isn't stormy" do
      subject.land(plane, clear_weather)
      expect(subject.planes.include?(plane)).to eq true
    end
    it "doesn't add a plane to the airport when weather is stormy" do
      subject.land(plane, stormy_weather)
      expect(subject.planes.include?(plane)).to eq false
    end
  end

  describe '#take_off' do
    it "raises an error if the plane is already flying" do
      plane.flying = true
      expect { subject.take_off(plane, clear_weather) }.to raise_error "Plane is currently flying"
    end
    it "removes a plane from the airport when weather isn't stormy" do
      subject.planes << plane
      subject.take_off(plane, clear_weather)
      expect(subject.planes.include?(plane)).to eq false
    end
    it "doesn't remove plane from airport when weather is stormy" do
      subject.planes << plane
      subject.take_off(plane, stormy_weather)
      expect(subject.planes.include?(plane)).to eq true
    end
  end
end
