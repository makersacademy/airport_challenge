require 'weather'

describe Weather do
  it { should respond_to :stormy? }

  it 'is expected to set weather_state to a random number between 1 and 5' do
    expect(subject.weather_state).to be_between(1, 5)
  end

  describe 'stormy? is expected to' do
    it 'return true if weather_state == 5' do
      allow(subject).to receive(:weather_state) { 5 }
      expect(subject.stormy?).to eq true
    end

    it 'else return false' do
      allow(subject).to receive(:weather_state) { 1..4 }
      expect(subject.stormy?).to eq false
    end
  end
end
