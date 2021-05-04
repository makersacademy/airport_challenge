require 'weather'

describe Weather do

  it 'weather responds to weatherforecast' do
    expect(subject).to respond_to(:weatherforecast)
  end

  it "it's calm" do
    allow(subject).to receive(:weatherforecast) { "calm" }
    expect(subject.weatherforecast).to eq "calm"
  end

  it "it's stormy" do
    allow(subject).to receive(:weatherforecast) { "stormy" }
    expect(subject.weatherforecast).to eq "stormy"
  end

end
