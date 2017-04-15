require 'plane'

describe Plane do

  it { is_expected.to respond_to(:land_at).with(1).argument }

#  describe '#land_at' do
#    before { allow(airport).to receive}
#    before do
#      airport = double(:airport, :planes => [subject])
#      subject.land_at(airport)
#    end
#      
#    it "adds itself to specified airport's @planes array" do
#      expect(airport.planes).to include subject
#    end
#  end

end
