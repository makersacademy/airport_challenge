require 'weather'

shared_examples_for 'weather_report' do
  before do
    allow(subject).to receive(:rand).and_return(1)
  end
  subject {described_class.new}

  it "is stormy when zeus returns 4" do
    allow(subject).to receive(:zeus) {4}
    expect(subject.weather_report).to eq("stormy")
  end

  it "is sunny when zeus returns 1,2,3 or 5" do
      allow(subject).to receive(:zeus) {3}
      expect(subject.weather_report).to eq("sunny")
    end

  it "stops planes taking off when stormy" do
    allow(subject).to receive(:weather_report) {"stormy"}
    expect{subject.take_off}.to raise_error "stormy day, no flying"
  end
end
