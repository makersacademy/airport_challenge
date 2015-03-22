require 'weather'

describe Weather do
  let(:weather) { Weather.new }
  it 'content sunny and stormy' do
    expect(subject.weather).to contain_exactly('Sunny', 'Stormy')
  end
  it 'can be sunny or stormy' do
    expect(subject.weather).to include(weather.condition)
  end
  # it 'is favourable to fly' do
  #   weather.stub(:condition).and_return('Sunny')
  #   expect(subject.favourable?).to eq true
  # end
end
