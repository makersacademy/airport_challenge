require 'weather'

describe Weather do
  it 'randomly selects a number' do
    expect(subject.random_number).to be_kind_of Integer
  end

  #it 'random selects a weather' do
  #  expect(subject.condition).to include(subject.random_weather)
  #end

  it 'randomly selects a weather' do
    allow(subject).to receive(:random_number) { 2 }

    expect(subject.random_weather).to eq('rain')
  end
end