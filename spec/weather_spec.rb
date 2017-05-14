require 'weather'

RSpec.describe Weather do
  subject(:weather) { described_class.new }

  describe "#clear?" do
    it "check if the weather is stormy when #random returns 10" do
      allow(weather).to receive(:random) { 10 }
      expect(weather.clear?).to eq false
    end

    it 'check if weather is clear when #random return 9 or less' do
      1.upto(9) do |random_number|
        allow(weather).to receive(:random) { random_number }
        expect(weather.clear?).to eq true
      end
    end
  end

  # describe "#random" do
  #   it "returns a number between 1 and 10" do
  #     expect(subject.random).to be_within(5).of(5)
  #   end
  # end
end
