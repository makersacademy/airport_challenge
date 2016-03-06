require 'weather'

describe Weather do
  let(:dummy_class) {Class.new {include Weather}}
  subject(:class) {dummy_class.new}

  describe 'stormy?' do

  it 'returns true when forecast is stormy' do
    allow(subject).to receive(:forecast).and_return(:stormy)
    expect(subject.stormy?).to be(true)
  end

  it 'returns false when forecast is not stormy' do
    allow(subject).to receive(:forecast).and_return(:sunny)
    expect(subject.stormy?).to be(false)
  end

  end
end
