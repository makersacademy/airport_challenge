require 'weather'
describe Weather do

  it { is_expected.to respond_to(:weather_system) }

  it 'Should return stormy' do
    srand(1)
    rand(2)
    allow(subject.weather_system).to receive("stormy")
    expect(subject.weather_system).to eq("stormy")
  end
end
