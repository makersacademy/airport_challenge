require 'weather'

describe Weather do
  let(:weather) {double :weather, sunny?: true}
  it "shows that it is sunny" do
    expect(weather.sunny?).to eq true
  end
end
