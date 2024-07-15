require 'weather'
describe Weather do
  it { is_expected.to respond_to(:stormy?) }
  it "can be stormy" do
    allow(subject).to receive(:stormy?).and_return(true)
  end
end
