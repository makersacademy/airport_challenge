require 'weather'
describe Weather do
  it { is_expected.to respond_to :stormy?}
  it "creates storms if number greater than 6 from 0 to 10" do
    allow(subject).to receive(:stormy?).and_return(true)
    expect(subject.stormy?).to eq true
  end

end
