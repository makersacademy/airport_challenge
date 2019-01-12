require 'weather'

RSpec.describe Weather do
  it { is_expected.to respond_to :current_weather? }

  describe '#current_weather?' do
    it 'is either sunny or stormy' do
    now = Weather.new
    allow(now).to receive(:current_weather?) { "sunny" }
    expect(now.current_weather?).to eq "sunny"
    allow(now).to receive(:current_weather?) { "stormy" }
    expect(now.current_weather?).to eq "stormy"
    end
  end
end
