require "weather.rb"
RSpec.describe Weather do
  describe "stormy? method" do
    context "exists" do
      it { is_expected.to respond_to(:stormy?)}
    end
  end
end