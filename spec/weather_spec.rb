require 'weather'

describe Weather do

  it 'the weather should be either stormy or sunny' do
    expect(subject.weather_now).to eq('stormy').or(eq('sunny'))
  end

end
