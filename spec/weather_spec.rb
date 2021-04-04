require 'weather'
describe Weather do
  it { is_expected.to respond_to(:present_weather) }
  it 'should give us a weather' do
    expect([:stormy, :clear]).to include(subject.present_weather)
  end
  it 'should give us a stormy weather' do
    allow(subject).to receive(:rand).and_return(9)
    expect(subject.present_weather).to eq(:stormy)
  end
end
 