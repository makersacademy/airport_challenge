require 'weather.rb'

describe Weather do
  it 'weather responds to weatherforcast' do
    expect(subject).to respond_to(:weatherforcast)
  end

  it "checks forecast for stormy weather" do
    allow(subject).to receive(:weatherforcast) { "stormy" }
    expect(subject.weatherforcast).to eq "stormy"
  end

  it "checks forecast for calm weather" do
    allow(subject).to receive(:weatherforcast) { "calm" }
    expect(subject.weatherforcast).to eq "calm"
  end

end
