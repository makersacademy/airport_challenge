require 'plane'

describe Plane do
  let(:airport) {double(:landing_area => true)}

  describe '#initialization' do
    it {expect(subject).to be_an_instance_of Plane}
  end

  




end
