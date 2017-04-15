require 'plane'

describe Plane do

  describe '#landed' do
    it "is expected to land" do
      plane = Plane.new
      expect(plane.landed).to eq :landed
    end
end

describe '#took_off' do
  it "is expected to take off a landed plan"do
  plane = Plane.new
  plane.landed
  expect(plane.took_off).to eq :flying
end
end



end
