require 'airport'
require 'plane'
describe Airport do

  describe 'initialize' do
    it 'can create an instance variable in Airport' do
      expect(subject).to be_an_instance_of(Airport)
    end 
    it 'initializes a plane variable' do
      expect(subject.landed_plane).to eq(nil)
    end
  end 
  describe'#full?' do
    it 'will check if the airport is not full' do
      expect(subject.full?).to eq false 
    end
    it 'will check if the airport is full' do
      plane = Plane.new 
      plane.land(subject)
      expect(subject.full?).to eq true
    end 
  end 
end 