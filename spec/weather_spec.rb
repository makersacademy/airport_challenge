require './lib/weather.rb'

describe Weather do
  context "Stormy" do
    it {is_expected.to respond_to :stormy? }
  end

end
