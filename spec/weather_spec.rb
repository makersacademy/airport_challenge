require 'weather'

describe Weather do

  let(:weather) { double :weather, :stormy= => true, stormy?: true }

  it { is_expected.to respond_to :stormy }

  it 'check weather is stormy' do
    expect(weather).to be_stormy
  end

  let(:weather2) { double :weather, :stormy= => false, stormy?: false }

  it "check weather is not stormy" do
    allow(weather2).to receive(:stormy).and_return(false)
    expect(weather2).to_not be_stormy
  end

end
