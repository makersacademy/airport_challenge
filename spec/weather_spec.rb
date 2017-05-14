require 'weather'
describe Weather do
  it 'should be able to generate weather conditions' do
    expect(subject).to respond_to :random_weather
  end
  # it 'should produce weather conditions' do
  #   expect(subject.random_weather).to eq 'Stormy'
  # end
end
