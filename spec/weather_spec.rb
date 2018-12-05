require 'weather'

describe 'Weather' do
  let(:weather) {Weather.new}
  it "expect to return is stormy" do
    allow(weather).to receive(:stormy?){true}
    expect(weather.stormy?).to eq true
  end

  it "expect to return not stormy" do
    allow(weather).to receive(:stormy?){false}
    expect(weather.stormy?).to eq false
  end

end
