require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it "checks #random_outlook returns stormy or fine" do
    expect(subject.send(:random_outlook)).to eq(:stormy).or(eq(:fine))
  end

  it "checks #stormy? returns true or false" do
    expect(subject.stormy?).to eq(true).or(eq(false))
  end

end
