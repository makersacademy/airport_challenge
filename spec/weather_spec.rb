describe Weather do
  subject(:weather) { described_class.new }

  describe "#forecast" do
    # randomly generated number defines the forecast.
    context "if number is lower than 8" do
      it "returns Sunny" do
        allow(Kernel).to receive(:rand).and_return(1)
        expect(weather.forecast).to eq("Sunny")
      end
    end

    context "if number is higher than 8" do
      it "returns Stormy" do
        allow(Kernel).to receive(:rand).and_return(8)
        expect(weather.forecast).to eq("Stormy")
      end
    end
  end
end
