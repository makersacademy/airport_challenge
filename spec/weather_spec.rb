require 'weather'

describe Weather do
  it { is_expected.to respond_to(:weather) }
  it { is_expected.to respond_to(:generate_weather) }
  it 'should return sunny or stormy' do
    subject.generate_weather
    expect(subject.weather).to eq('Sunny').or eq('Stormy')
  end
end
