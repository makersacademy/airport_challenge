require 'weather'
require 'airport'

describe Weather do

  it { is_expected.to respond_to :stormy? }

  it "stormy method to return true when number generated above 90" do
    allow_any_instance_of(Weather).to receive(:rand).and_return(95)
    expect(subject.stormy?).to eq true
  end
  it "stormy method to return false when number generated below 90" do
    allow_any_instance_of(Weather).to receive(:rand).and_return(50)
    expect(subject.stormy?).to eq false
  end

end
