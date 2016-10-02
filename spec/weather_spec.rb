require "weather"

describe Weather do

  before :each do
    @weather = Weather.new
  end

  describe "#stormy?" do
    context "when #random_outlook is :stormy" do
      it "can produce true as an output" do
        allow(@weather).to receive(:random_outlook).and_return :stormy
        expect(@weather.stormy?).to eq true
      end
    end

    context "when #random_outlook is :fine" do
      it "can produce false as an output" do
        allow(@weather).to receive(:random_outlook).and_return :fine
        expect(@weather.stormy?).to eq false
      end
    end
  end

end
