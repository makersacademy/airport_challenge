require 'weather'

shared_examples_for 'weather_report' do
  include Weather
  #weather = double(weather, :rand => 4)
  subject {described_class.new}

  it "is stormy when zeus returns 4" do
    allow(subject).to receive(:zeus) {4}
    expect(subject.weather_report).to eq("stormy")
  end

  it "is sunny when zeus returns 1,2,3 or 5" do
      allow(subject).to receive(:zeus) {3}
      expect(subject.weather_report).to eq("sunny")
    end
end

=begin
describe Weather do
#Kernel.expect(:rand).with(4).to eq("stormy")
let(:weather) {double(weather)}

  it "randomly is stormy when seeded 4" do
    allow(weather).to receive(:zeus)
    allow(weather).to receive(:rand).with (4)
    expect(weather.zeus).to eq("stormy")
  end
=end
