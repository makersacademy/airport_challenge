require 'weather'

describe Weather do
  describe '#report' do
    it 'gets the current weather report to determine landing/ takeoff safety' do
      expect(["sunny", "stormy"]).to include(subject.report)
    end

    it 'weather can be stormy' do
      weather = double()
      weather.stub(:report) { "stormy" }
      expect(weather.report).to eq 'stormy'
    end
  end
end
