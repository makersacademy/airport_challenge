require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  it "#report_weather should return a random weather condition" do
    count = 0
    10.times { count += 1 if airport.report_weather != airport.report_weather }
    expect(count).to be > 5
  end

  context "In Stormy weather" do
    it "#prevent_take_off should prevent take off when report_weather returns 'stormy'" do
      allow(airport).to receive(:report_weather).and_return("stormy")
      expect(airport.prevent_take_off).to eq true
    end
  end

  context "Any acceptable weather" do
    it "#prevent_take_off should allow take off when report_weather returns 'sunny'" do
      allow(airport).to receive(:report_weather).and_return("sunny")
      expect(airport.prevent_take_off).to eq false
    end

    it "#prevent_take_off should allow take off when report_weather returns 'mild'" do
      allow(airport).to receive(:report_weather).and_return("mild")
      expect(airport.prevent_take_off).to eq false
    end

    it "#prevent_take_off should allow take off when report_weather returns 'rainy'" do
      allow(airport).to receive(:report_weather).and_return("rainy")
      expect(airport.prevent_take_off).to eq false
    end
  end
end      
    