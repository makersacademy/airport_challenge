require 'weather'

describe Weather do

  it { is_expected.to respond_to :sunny? }

  it "should always return true or false" do
    w = Weather.new.sunny?
    expect([true, false].include? w).to eq true
  end

end
