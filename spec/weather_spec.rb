require "weather"

describe Weather_Reporter do
   subject(:weather_reporter) { described_class.new }
    
    describe "#stormy?" do
        it "may not be stormy" do
            allow(Kernel).to receive(:rand).and_return 1
            expect(weather_reporter.stormy?).to be false
    end

        it "may be stormy" do
            allow(Kernel).to receive(:rand).and_return 4
            expect(weather_reporter.stormy?).to be true
    end
  end 
end 
