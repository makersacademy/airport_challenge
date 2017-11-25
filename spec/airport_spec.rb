require 'airport.rb'
describe Airport do
  describe '#land' do
    it "lands a plane at the airport" do
      plane = Plane.new
      expect(subject.land(plane).include?(plane)).to eq true
    end
  end
end
