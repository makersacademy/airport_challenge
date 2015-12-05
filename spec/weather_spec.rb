require 'weather'

describe Weather do
  let(:weather) {described_class.new}


  it "can be stormy" do
    srand(0)
    expect(weather).to be_stormy
  end
  it "can be not stormy" do
    srand(1)
    expect(weather).not_to be_stormy
  end
end
