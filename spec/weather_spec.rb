require "./lib/weather.rb"
describe Weather do
  it "checks the weather is live and kicking correct values" do
    expect([:normal, :stormy].include?(subject.forecast)).to eq(true)
  end
end