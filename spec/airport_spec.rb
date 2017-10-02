require 'airport'
require './lib/plane'

describe Airport do

  describe '#permission_to_land' do
    it 'gives a plane permission to land at airport' do
      expect(subject.permission_to_land(Plane.new)).to be_instance_of Plane
    end
  end

  describe '#permission_to_take_off' do
    it 'gives a plane permission to leave the airport' do
      expect(subject.permission_to_take_off(Plane.new)).to be_instance_of Plane
    end
  end

  describe '#planes' do
    it 'stores an array of planes in the airport' do
      expect(subject.planes).to be_instance_of(Array)
    end

    # it 'stores planes with permission to land' do
    #   plane = Plane.new
    #   expect(subject).to receive(:permission_to_land).and_return(plane)
    #   expect(subject.planes).to eq subject.permission_to_land
    # end
  end

end
