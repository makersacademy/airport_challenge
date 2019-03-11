require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }

  it "randomly choose the weather (stormy or not)" do
    weather = Weather.new
  end
end
