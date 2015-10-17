require 'plane'

describe Plane do

# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a flying plane cannot take off and cannot be in an airport
  describe 'plane state' do
    it { is_expected.to_not be_flying }
    it 'should be able to fly' do
      expect(subject.takeoff).to eq true
    end
    it 'should be able to land' do
      subject.takeoff
      expect(subject.land).to eq false
    end
    it 'should raise an error when attempting to land when already on the ground' do
      expect{subject.land}.to raise_error "Already on the ground!"
    end
    it 'should raise an error when attempting to takeoff when already flying' do
      subject.takeoff
      expect{subject.takeoff}.to raise_error "Already flying!"
    end
  end
end