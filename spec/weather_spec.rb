require 'weather'

describe Weather do
  it 'is expected to set weather_state to a random number between 1 and 10' do
    expect(subject.weather_state).to be_between(1, 10)
  end

  describe 'stormy? is expected to' do
    it 'return true if weather_state == 10' do
      allow(subject).to receive(:weather_state) { 10 }
      expect(subject.stormy?).to eq true
    end

    it 'else return false' do
      allow(subject).to receive(:weather_state) { 1..9 }
      expect(subject.stormy?).to eq false
    end
  end
end
