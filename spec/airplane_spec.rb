require 'airplane'

describe Airplane do

let (:airport) {double :airport}
subject (:airplane){ described_class.new }

  context "Landing" do

    it "lands" do
     is_expected.to respond_to :land
    end

    it "is not airborn when landed" do
      airplane.land(airport)
      expect(airplane).to_not be_airborn
    end

  end

end
