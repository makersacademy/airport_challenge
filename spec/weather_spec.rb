require 'weather'

RSpec.describe Weather do
  it 'instructs to receive current weather' do
    is_expected.to respond_to(:current)
  end

  it 'returns either stormy or clear' do
    expect(Weather.current).to eq("stormy").or eq("clear")
  end
end
