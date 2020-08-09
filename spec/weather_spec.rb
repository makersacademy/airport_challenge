require 'weather'

describe Weather do
  it "weather exists" do
    weather = Weather.new
    expect(weather).to be_an_instance_of(Weather)
  end

  it { is_expected.to respond_to :stormy? }
  
end
