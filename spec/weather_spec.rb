require 'weather'

describe Weather do

  it { is_expected.to respond_to :stormy? }
  
  it "returns a boolean value true (rare) for stormy, false (common) for sunny" do
    expect(subject.stormy?).to be(true).or be(false)
  end  

end
