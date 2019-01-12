require './lib/weather.rb'

describe Weather do
  describe "#stormy?" do
  it "generates weather based on a number" do
    expect(subject).to receive(:rand).and_return(2)
      expect(subject.stormy?).to eq false
    end
  end
end
