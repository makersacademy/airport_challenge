require 'weather'

describe Weather do
  it { is_expected.to respond_to :current }

  it "should contain a possible weather" do
    expect(subject.current).to eq("Sunny").or eq("Stormy")
  end
end
