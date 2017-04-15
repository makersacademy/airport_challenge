require 'plane'

describe Plane do

  describe '#landed' do
    it "is expected to land" do
      plane = Plane.new
      expect(plane.landed).to eq :landed
    end
end



end
