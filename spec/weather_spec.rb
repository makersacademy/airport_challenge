require 'weather'

describe Weather do
  let(:weather) {double :weather}
  it {is_expected.to respond_to :stormy?}
  it 'can be stormy' do
    allow(weather).to receive(:stormy?).and_return(true)
    expect(weather).to be_stormy
  end

  it 'can be not stormy' do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(subject).not_to be_stormy
  end

  it 'generates storms when storm rate 1' do
    allow(weather).to receive(:generate_weather).with(1)
    allow(weather).to receive(:stormy?)
    subject.generate_weather(1)
    expect(subject).to be_stormy
  end

  it 'responds to storm rate of zero with no storm' do
    allow(weather).to receive(:generate_weather).with(0)
    allow(weather).to receive(:stormy?)
    subject.generate_weather(0)
    expect(subject).not_to be_stormy
  end
end
