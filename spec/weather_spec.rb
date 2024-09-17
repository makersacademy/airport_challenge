require './lib/weather'

describe Weather do
  let(:weather) { double :weather, :sunny => true, sunny?: true }
  it { is_expected.to respond_to :sunny? }
  it "checks if weather is sunny" do
    expect(weather).to be_sunny
  end
end
