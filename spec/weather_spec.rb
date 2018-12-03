require 'weather'

describe "#weather" do
  let(:weather) { Weather.new }

  describe "#random" do
    it "chooses a number at random" do
      expect(weather.random).to be_between(1, 7)
    end
  end

  describe "stormy?" do
    context "it is not stormy" do
      it "means the weather is sunny" do
        allow(weather).to receive(:rand).and_return(5)
        expect(weather.conditions).to eql(false)
      end
    end

    context "it is stormy" do
      it "means the weather is stormy" do
        allow(weather).to receive(:rand).and_return(1)
        expect(weather.conditions).to eql(true)
      end
    end
  end
end
