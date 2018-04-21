require 'plane'

describe Plane do

subject(:plane) { described_class.new }

  it {is_expected.to respond_to(:status)}

  describe "#landed" do
    it "changes status of the plane to 'at_airport' " do
      expect(subject.flying).to eq :at_airport
    end
  end
end
