require "weather.rb"
RSpec.describe Weather do
  describe "stormy? method" do
    context "returns boolean" do
      it "true or false" do
        expect(Weather.stormy?).to be_(true).or be (false)
      end
    end
  end
end