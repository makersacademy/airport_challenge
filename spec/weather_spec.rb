require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  it { is_expected.to respond_to :random_weather}
  
end
