require 'weather'
describe Weather do

  describe "#stormy" do
    it "should respond to the stormy? method" do
      expect(subject).to respond_to :stormy?
    end

    it "should return a boolean" do
      expect([true, false]).to include(subject.stormy?)
    end
  end

end
