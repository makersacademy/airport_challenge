require "weather"

describe Weather do

  describe "default to not stormy" do
    it { expect(subject.stormy).to eq(false) }
  end
  describe "allows to be set to stormy" do
    it { expect(subject.set_stormy).to eq(true) }
  end

end
