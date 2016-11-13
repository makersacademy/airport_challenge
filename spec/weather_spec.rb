require 'weather'

describe Weather do

  it {is_expected.to respond_to :current_weather}

  # it {is_expected.to respond_to :stormy?}

  it {is_expected.to respond_to :weather_randomizer}

  it 'can be stormy' do
    allow(subject).to receive(:current_weather).and_return('stormy')
    expect(subject.current_weather).to eq 'stormy'
  end

  it 'can be not stormy' do
    allow(subject).to receive(:current_weather).and_return('not stormy')
    expect(subject.current_weather).to eq 'not stormy'
  end

  it 'can return the number 1 at random' do
    allow(subject).to receive(:weather_randomizer) { 1 }
    expect(subject.weather_randomizer).to eq 1
  end

  it 'can return the number 2 at random' do
    allow(subject).to receive(:weather_randomizer) { 2 }
    expect(subject.weather_randomizer).to eq 2
  end

  # it 'can return the number 3 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 3 }
  #   expect(subject.weather_randomizer).to eq 3
  # end
  #
  # it 'can return the number 4 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 4 }
  #   expect(subject.weather_randomizer).to eq 4
  # end
  #
  # it 'can return the number 5 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 5 }
  #   expect(subject.weather_randomizer).to eq 5
  # end
  #
  # it 'can return the number 6 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 6 }
  #   expect(subject.weather_randomizer).to eq 6
  # end
  #
  # it 'can return the number 7 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 7 }
  #   expect(subject.weather_randomizer).to eq 7
  # end
  #
  # it 'can return the number 8 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 8 }
  #   expect(subject.weather_randomizer).to eq 8
  # end
  #
  # it 'can return the number 9 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 9 }
  #   expect(subject.weather_randomizer).to eq 9
  # end
  #
  # it 'can return the number 10 at random' do
  #   allow(subject).to receive(:weather_randomizer) { 10 }
  #   expect(subject.weather_randomizer).to eq 10
  # end

end
