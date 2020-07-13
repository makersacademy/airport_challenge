describe Weather do

  let(:weather) { double :weather, :sunny= => true, sunny?: true }

  it { is_expected.to respond_to :sunny }

  it "checks weather is sunny" do
    expect(weather).to be_sunny
  end

  let(:weather2) { double :weather, :sunny= => false, sunny?: false }

  it "checks weather is not sunny" do
    allow(weather2).to receive(:sunny).and_return(false)
    expect(weather2).to_not be_sunny
  end

end
