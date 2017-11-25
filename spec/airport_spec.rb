require 'airport.rb'
describe Airport do
  describe '#land' do
    it "lands a plane at the airport" do
      plane = Plane.new
      expect(subject.land(plane).include?(plane)).to eq true
    end
  end

  describe '#take_off' do
    it 'removes a plane from the airport' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.include?(plane)).to eq false
    end
  end
end
