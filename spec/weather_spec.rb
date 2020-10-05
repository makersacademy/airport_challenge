require 'weather'

describe Weather do

  it 'can create a new instance of weather' do
    expect(subject).to be_instance_of Weather
  end

  it 'can select a random number between 1&100' do
    stub(:rand) {74}
    expect(subject.random_number).to eq 74
  end

  it 'can return the weather as sunny' do
    stub(:rand) {5}
    expect(subject.weather).to eq 'sunny'
  end
end
