require 'weather.rb'

describe Weather do

  it {is_expected.to respond_to :stormy?}

  describe "stormy" do
    it "checks whether weather is stormy" do
      allow(subject).to receive(:stormy?).and_return("sunny", "stormy")
    end
  end

end
