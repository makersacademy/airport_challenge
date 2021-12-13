require 'weather'

describe Weather do
  describe '.report' do 
    it 'can be stormy or clear' do
      allow(subject).to receive(:air_pressure_reading) { 1 }
      expect(subject.report).to eq("Blue Skies Ahead")
    end

    it 'can be clear' do 
      allow(subject).to receive(:air_pressure_reading) { 0 }
      expect(subject.report).to eq("Storms on the Horizon")
    end
  end

  describe '.air_pressure_reading' do
    it 'number' do 
      expect(0...13).to include(subject.air_pressure_reading)
    end
  end
end
