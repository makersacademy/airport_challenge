require 'weather'

describe Weather do

  it 'Checks current weather status' do
    expect(subject).to respond_to :current_weather
  end
  
end
