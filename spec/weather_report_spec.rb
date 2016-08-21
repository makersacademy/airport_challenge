require 'weather'

shared_examples_for 'weather_report' do
  subject {described_class.new}
  let(:weather_report) { :weather_report == "sunny"}

  it "is stormy when zeus returns 4" do
    allow(subject).to receive(:zeus) {4}
    expect(subject.weather_report).to eq("stormy")
  end

  it "is sunny when zeus returns 1,2,3 or 5" do
      allow(subject).to receive(:zeus) {3}
      expect(subject.weather_report).to eq("sunny")
    end
end
