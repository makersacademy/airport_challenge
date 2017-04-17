require 'weather'

describe Weather do

  it { is_expected.to respond_to :stormy }

  it "randomly a decides if the weather is stormy or not" do
    Weather.new
    expect(subject.stormy?).to be(true).or be(false)
  end


end
