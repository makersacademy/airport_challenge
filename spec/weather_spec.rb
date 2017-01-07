require "weather"

describe Weather do

  let(:weather) {double :weather, :sunny= => true, sunny?: true}

  # TEST: Respond to Variable condition
  it { is_expected.to respond_to :sunny }

  # TEST: Check weather condition
  it "Check weather = sunny" do
    expect(weather).to be_sunny
  end

  # TEST: Check weather condition
  let(:weather2) {double :weather, :sunny= => false, sunny?: false}
  it "Check weather != sunny" do
    allow(weather2).to receive(:sunny).and_return(false)
    expect(weather2).to_not be_sunny
  end
end
