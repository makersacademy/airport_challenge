require "airport"
describe Airport do
  describe ".full?" do
    context "given a number greater than or equal to 10" do
      it "returns true" do
        expect(Airport.full?(10)).to eql(true)
      end
    end
    context "given a number less than 10" do
      it "returns false" do
        expect(Airport.full?(2)).to eql(false)
      end
    end
  end
end
