require 'airport'
describe Airport do
  it 'change capacity of airport' do
    expect(subject.change_capacity(30)).to eq(30)
  end
  it { is_expected.to respond_to(:stormy?) }
  it 'returns true if weather is stormy' do
    allow(subject.weather).to receive(:present_weather).and_return(:stormy)
    expect(subject).to be_stormy
  end
end
