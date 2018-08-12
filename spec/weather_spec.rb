require "Weather"
describe Weather do

  subject(:weather) {described_class.new}

  it "generates stormy weather" do
    expect(weather.generate).to eq "Stormy"
  end
end