require 'weather'

describe Weather do
  it 'responds to the method check_weather' do
    expect(subject).to respond_to :check_weather
  end

  it 'should return "sunny" as an outcome of check_weather' do
    allow(subject).to receive(:chance) { 84 }
    expect(subject.check_weather).to eq("sunny")
  end

  it 'should return "stormy" as an outcome of check_weather' do
    allow(subject).to receive(:chance) { 95 }
    expect(subject.check_weather).to eq("stormy")
  end
end
