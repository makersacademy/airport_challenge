require "airport.rb"
RSpec.describe Airport do
  describe "land method" do
    context "exists" do
      it { is_expected.to respond_to(:land)}
    end
    context "can take one argument" do
      it { is_expected.to respond_to(:land).with(1).argument }
    end
  end
end