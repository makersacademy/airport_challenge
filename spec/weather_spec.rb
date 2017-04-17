require './lib/weather.rb'

describe Weather do
  subject(:weather) { described_class.new }
  context "Stormy" do
    it { is_expected.to respond_to :stormy? }

    it "Expects a true or false from the #stormy? " do
      expect(weather.stormy?).to eq(true || false)
    end
  end
end
