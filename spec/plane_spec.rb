require 'plane'

describe Plane do

  let(:plane) { described_class.new }

  describe 'respond and initiate' do
    it "responds to a method"do
      expect(plane).to respond_to(:land)
      expect(plane).to respond_to(:depart)
      expect(plane).to respond_to(:airport)
    end

    it "can initialize a new plane" do
      expect(plane).to be_a(Plane)
    end


  end

end
