require './lib/airport.rb'

describe Airport do
  describe '#land' do
    it 'responds to #land with 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'stores a plane in the airport hangar' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to eq(plane)
    end
  end
  describe '#take_off' do
    it 'responds to #take_off with 1 argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'removes the plane from the airport hangar' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to eq(nil)
    end
  end
end