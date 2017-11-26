require 'airport.rb'
describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {Plane.new}
  describe '#land' do
    it "lands a plane at the airport" do
      expect(subject.land(plane).include?(plane)).to eq true
    end
  end

  describe '#take_off' do
    it "removes a plane from the airport when weather isn't stormy" do
      subject.land(plane)
      subject.take_off(plane)
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
