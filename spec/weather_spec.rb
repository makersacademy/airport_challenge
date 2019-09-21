require "weather"

describe Weather do

  describe '#initialize' do
    it "if the weather is stormy, stormy? returns true" do
    allow_any_instance_of(Weather).to receive(:rand).and_return 5
    expect(subject.stormy?).to eq true
    end
  end
end
