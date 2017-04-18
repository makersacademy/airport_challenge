shared_examples_for Weather do
  it "STORM is value 9" do
    expect(WeatherTest::STORM).to eq 9
  end
  it { is_expected.to respond_to(:stormy?) }

  it "stubbing the value to STORM gets STORM (d'oh)" do
    allow(subject).to receive(:stormy?) { true }
    expect(subject.stormy?).to eq true
  end
end
