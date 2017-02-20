require 'weather'

describe Weather do

  it 'Checks current weather status' do
    expect(subject).to respond_to :current_weather
  end

  it 'Checks if weather is stormy' do
    allow(subject).to receive(:stormy?).and_return true
    expect(subject.stormy?).to eq true
  end

end
