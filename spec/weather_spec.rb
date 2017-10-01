require 'weather'
describe Weather do

  describe "#stormy" do
    it "should return a boolean" do
      expect([true, false]).to include(subject.stormy?)
    end
  end

end
