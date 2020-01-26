require "weather.rb"
RSpec.describe Weather do
  describe "stormy? method" do
    context "exists" do
      it { is_expected.to respond_to(:stormy?)}
    end
    context "returns boolean" do
      it "true or false" do
        expect(subject.stormy?).to be_(true).or be (false)
      end
    end
  end
end