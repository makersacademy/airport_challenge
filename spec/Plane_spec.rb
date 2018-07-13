
require './lib/Plane'

describe Plane do

  describe 'land' do
    it { expect(subject).to respond_to(:land) } # plane can land
    it { expect(subject.land(Airport.new)).to eq(subject) } # land method returns a plane
  end

  describe 'take_off' do
    it { expect(subject).to respond_to(:take_off) } # plane can take off
  end
end
