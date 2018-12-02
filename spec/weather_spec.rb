require 'weather'

RSpec.describe Weather do

  it 'checks if the weather is stormy' do
    expect(Weather.new.stormy?).to be(true).or be(false)
  end

end
