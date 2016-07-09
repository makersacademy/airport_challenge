require 'airport'
require 'plane'

describe Airport do
  it {is_expected.to respond_to(:land)}


  describe '#land' do
    it 'Lands a plane' do
      expect(subject.land).to be_instance_of Plane
    end
  end
end
