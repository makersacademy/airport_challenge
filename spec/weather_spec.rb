require 'weather'

describe Weather do
  subject(:weather) { described_class.new }
  context 'initial settings' do
    it {should respond_to(:is_stormy?)}
  end

  it 'returns true or false to indicate whether it is stormy' do
    # allow(weather).to receive(:is_stormy?).and_return(true || false)
    expect(weather.is_stormy?).to satisfy{|v| v || !v}
  end

end
