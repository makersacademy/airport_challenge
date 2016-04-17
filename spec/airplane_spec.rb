require 'airplane'

describe Airplane do

let (:airport) {double :airport}
subject (:airplane){ described_class.new }

  context "Landing" do

    xit "lands" do
     is_expected.to respond_to :land
    end

    xit "confirm that it is not airborn when landed" do
      airplane.land
      expect(airplane).to_not be_airborn
    end

  end

  context "Landing" do

    xit "takes off" do
     is_expected.to respond_to :takeoff
    end

    xit "confirm that it is airborn after having taken off" do
      airplane.land
      airplane.takeoff
      expect(airplane).to be_airborn
    end

  end
end
