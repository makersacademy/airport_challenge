require 'weather'

describe Weather do
  subject(:weather){described_class.new}
  # it {is_expected.to respond_to :stormy?}
  # it {is_expected.to respond_to :random_weather}

  it 'generates a boolean for stormy?' do
    expect([true, false]).to include weather.stormy?
  end

end
