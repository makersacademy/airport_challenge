require 'weather'

describe Weather do
  it 'creates instance of Weather' do
    expect(Weather.new).to be_a Weather
  end
  it 'can check weather conditions' do
    allow(subject).to receive(:bad_conbditions_generator) {3}
    expect(subject.stormy?).to be false
  end
end
