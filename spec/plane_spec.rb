require 'plane'

describe Plane do

subject(:plane) { described_class.new }

  it {is_expected.to respond_to(:status)}

  context "#landed" do
    it "changes status of the plane to 'at_airport' " do
      expect(subject.landed).to eq :at_airport
    end

  context "#flying" do
    it "changes status of the plane to 'in_the_air' " do
      expect(subject.flying).to eq :in_the_air
    end

  end
  end
end
