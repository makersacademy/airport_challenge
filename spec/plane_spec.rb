require 'plane'

RSpec.describe Plane do

  describe 'take off' do
    it 'changes the location indicatior of the plane to air' do
      subject.take_off
      expect(subject.location).to eq('air')
    end
  end

  describe 'land' do
    it 'changes the location indicator of the plane to airport' do
      subject.land
      expect(subject.location).to eq('airport')
    end
  end

end