require 'weather'

describe Weather do
  let(:weather) {described_class.new}


  it "can be stormy" do
    allow(Kernel).to receive(:rand).and_return 0
    expect(weather).to be_stormy
  end
  it "can be not stormy" do
    allow(Kernel).to receive(:rand).and_return 1
    expect(weather).not_to be_stormy
  end
end
