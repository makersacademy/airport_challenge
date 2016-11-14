require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  it 'should respond to condition' do
    expect(weather).to respond_to :condition
  end

  it 'should be either sunny or stormy' do
    expect([:sunny, :stormy]).to include weather.condition
  end

  it 'should have stormy weather sometimes' do
    stormy_counter = 0
    sunny_counter = 0
    100.times{
      if Weather.new.condition == :stormy
         stormy_counter += 1
      else
        sunny_counter += 1
      end
    }
    expect(stormy_counter).to be > 0
    expect(sunny_counter).to be > 0

  end
end
