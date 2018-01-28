require 'weather'

describe Weather do
  describe '#stormy' do
    it "checks if the weather is stormy or not" do
      expect(subject.stormy?).to eq(true).or(eq(false))
    end
  end
end
