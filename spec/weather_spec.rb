require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }
  it "should be stormy or not" do
    expect(subject.stormy?).to eq(true).or(eq(false))
  end
end