require 'airport'
require 'plane'

describe Airport do
  describe 'landing' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'adds the landed plane to the hangar' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to eq([plane])
    end
  end
  describe 'take-off' do
    it { is_expected.to respond_to(:take_off) }
    it 'removes and confirms plane has left the hanger' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq("#{plane} has left the hangar")
      # expect the method to take a plane out of the hangar
    end
  end
  describe 'hangar' do
    it 'stores planes at the airport' do
      expect(subject.hangar).to be_an_instance_of(Array)
    end
    it { is_expected.to respond_to(:capacity) }
    it 'returns the capacity of the hangar' do
      expect(subject.capacity).to eq(24)
    end
    it { is_expected.to respond_to(:hangar_full?) }
    # expect that if @hangar = @capacity subject.land
    # returns "this plane can't land" and doesn't push
  end

end
