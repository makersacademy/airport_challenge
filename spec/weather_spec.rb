require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Weather do
  let(:weather) { double :weather}
  let(:subject) { Weather.new }
  it {is_expected.to respond_to :stormy?}
  it 'it returns true if weather is stormy' do
    allow(Kernel).to receive(:rand).and_return(1)
    expect(subject.stormy?).to be true
  end
  it 'it returns true if weather is stormy' do
    allow(Kernel).to receive(:rand).and_return(2)
    expect(subject.stormy?).to be false
  end
end
