require 'airport'

describe Airport do

  let (:plane) { Plane.new }
  let(:weather) { double weather, weather_now == 'clear' }
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it "Docks plane when landed" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to include(plane)
    end
    it "should raise an error, because airport full" do
      airport = Airport.new
      plane = Plane.new
      subject.capacity.times { subject.land plane }
      expect { subject.land(plane) }.to raise_error("No landing, airport full")
    end
  end
  describe '#take_off' do
    it 'Plane takes off from airport' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect(airport.take_off(plane)).to be_an_instance_of Plane
    end
    it "Shows the plane is not in airport" do
      plane = Plane.new
      airport = Airport.new
      expect(subject.planes).not_to include(plane)
    end
  #   describe '#take_off' do
  #     context 'when weather stormy' do
  #   it "Doesn't let plane take-off if stormy weather" do
  #     weather = Weather.new
  #     plane = Plane.new
  #     before do
  #     allow(weather).to receive(:weather_now).and_return :stormy
  #   end
  #     expect { subject.take_off(plane) }.to raise_error "No take-off, stormy weather"
  #   end
  end
end
