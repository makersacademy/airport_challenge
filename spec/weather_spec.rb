require 'Weather.rb'

describe Weather do
  subject(:weather) {described_class.new}

it 'has a weather class' do
  expect(weather).to be_a (Weather)
end

it { is_expected.to respond_to :stormy?}

it 'tests that weather is stormy' do
  allow(weather).to receive(:random_generator).and_return(19)
  expect(weather.stormy?).to eq true
end

it 'tests that weather isn\'t stormy' do
  allow(weather).to receive(:random_generator).and_return(21)
  expect(weather.stormy?).to eq false
end
end