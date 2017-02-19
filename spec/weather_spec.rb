require 'weather'

describe Weather do

  it { is_expected.to respond_to :sunny? }

  it "should always return true or false" do
    expect(Weather.new.sunny?).to eq ( true || false )
  end

end
