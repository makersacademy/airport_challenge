require 'weather'

describe Weather do

  let(:weather) {double :weather}

  it 'is stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
  end
  it 'is sunny' do
    allow(weather).to receive(:stormy?).and_return(false)
  end

end
