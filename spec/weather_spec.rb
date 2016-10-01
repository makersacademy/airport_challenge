require './lib/weather.rb'

describe Weather do

  it{ is_expected.to respond_to :forecast }

  it { is_expected.to respond_to :sunny?}

  it { is_expected.to respond_to :stormy?}

  it "should always be stormy" do
    weather = Weather.new
    allow(weather).to receive(:forecast) { "stormy" }
    expect(weather.forecast).to eq "stormy"
    end

end
