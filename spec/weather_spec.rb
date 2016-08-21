require 'weather'

describe Weather do
  it 'returns true when weather generator gives stormy' do
    allow(subject).to receive (:rand) { 1 }
    #weather.rand
    subject.weather_generator
    expect(subject.stormy?).to eq (true)
  end
end
