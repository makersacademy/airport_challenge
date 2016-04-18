require 'plane'

describe Plane do

 let(:plane) {Plane.new}
 let(:airport) {double("airport")}

    it 'can create a plane object' do
      expect(plane).to be_an_instance_of Plane
    end

  describe "#storm" do
    it 'responds to weather' do
      expect(subject).to respond_to(:storm)
    end
  end
end