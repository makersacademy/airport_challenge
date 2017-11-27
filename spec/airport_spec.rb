require 'airport.rb'
describe Airport do

  subject(:airport) { described_class.new }
  let(:flying_plane) { double(:flying_plane, flying: true) }
  let(:grounded_plane) { double(:grounded_plane, flying: false) }
  let(:clear_weather) { double(:clear_weather, stormy: false, change_weather: true) }
  let(:stormy_weather) { double(:stormy_weather, stormy: true, change_weather: false) }

  describe 'capacity' do
    it "should have a variable capacity" do
      twenty_airport = Airport.new(20)
      20.times { twenty_airport.land(Plane.new, clear_weather) }
      expect { twenty_airport.land(flying_plane, clear_weather) }.to raise_error "Airport full"
    end
  end

  describe '#land' do
    it "raises an error when the plane is already grounded" do
      expect { subject.land(grounded_plane, clear_weather) }.to raise_error "Plane is grounded"
    end
    it "adds a plane to the airport when weather isn't stormy" do
      plane = Plane.new
      subject.land(plane, clear_weather)
      expect(subject.planes.include?(plane)).to eq true
    end
    it "doesn't add a plane to the airport when weather is stormy" do
      subject.land(flying_plane, stormy_weather)
      expect(subject.planes.include?(flying_plane)).to eq false
    end
  end

  describe '#take_off' do
    it "raises an error if the plane isn't in the airport" do
      expect { subject.take_off(flying_plane, clear_weather) }.to raise_error "Airport doesn't contain that plane"
    end
    it "removes a plane from the airport when weather isn't stormy" do
      plane = Plane.new
      subject.planes << plane
      subject.take_off(plane, clear_weather)
      expect(subject.planes.include?(plane)).to eq false
    end
    it "doesn't remove plane from airport when weather is stormy" do
      subject.planes << grounded_plane
      subject.take_off(grounded_plane, stormy_weather)
      expect(subject.planes.include?(grounded_plane)).to eq true
    end
  end
end
