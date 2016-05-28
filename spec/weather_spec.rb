require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe "#stormy?" do
    it "true if 0 is result of rand(5)" do
      Kernel.stub(:rand).with(5) { 0 }
      expect(weather.stormy?).to eq true
    end

    random_results = [1,2,3,4]
    random_results.each do |result|
      it "false if #{result} is result of rand(5)" do
        Kernel.stub(:rand).with(5) { result }
        expect(weather.stormy?).to eq false
      end
    end
  end
end
