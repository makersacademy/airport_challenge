require 'weather'

RSpec.describe Weather do

  let (:weather) { described_class.new }

  it 'will randomly generate weather' do
    expect(weather.stormy?).to be(true).or be(false)
  end

end
