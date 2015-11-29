require 'weather'

describe Weather do
  it 'gives the #current_weather' do
    expect(subject).to respond_to(:current_weather)
  end
end
