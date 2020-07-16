require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#took_off' do
    it "Plane is set to be airborne upon initialization" do
      expect(plane).to be_airborne
    end
  end

end
