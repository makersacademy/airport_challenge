require 'weather'

describe Weather do
  it 'Should have a weather class' do
    expect(subject).to be_instance_of(Weather)
  end

  describe '#weather_check' do
    it 'Should respond to #weather_check' do
      expect(subject).to respond_to(:weather_check)
    end

    it 'Should return a clear' do
      allow(subject).to receive(:rand) { 3 }
      expect(subject.weather_check).to eq("Clear")
    end

    it 'Should return a stormy' do
      allow(subject).to receive(:rand) { 5 }
      expect(subject.weather_check).to eq("Stormy")
    end
  end

end
