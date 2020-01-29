require './lib/weather.rb'
# check that test runs

# run weather 20 times and check both storm and non stormy
describe Weather do
  it { is_expected.to respond_to(:generate_weather) }
  it "give 20% chance of a storm" do
    generator = Weather.new
    allow(generator).to receive(:rand).and_return(1)
    expect(generator.generate_weather).to eq("Storm")
  end

  it "give 80% chance of no storm w/ rand 0, 2-5" do
    generator = Weather.new
    allow(generator).to receive(:rand).and_return(2)
    expect(generator.generate_weather).to eq("Not Storm")
    allow(generator).to receive(:rand).and_return(3)
    expect(generator.generate_weather).to eq("Not Storm")
    allow(generator).to receive(:rand).and_return(4)
    expect(generator.generate_weather).to eq("Not Storm")
    allow(generator).to receive(:rand).and_return(0)
    expect(generator.generate_weather).to eq("Not Storm")
  end
end
