require "weather"

describe Weather do
  it 'can be stormy' do
    allow(Weather).to receive(:rand).and_return 6
    expect(Weather.stormy?).to be true
  end

  it 'can be nice' do
    allow(Weather).to receive(:rand).and_return 1
    expect(Weather.stormy?).to be false
  end
end
