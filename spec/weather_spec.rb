require 'weather'

RSpec.describe Weather do
  it 'instruct to receive current weather' do
    is_expected.to respond_to(:current)
  end
end