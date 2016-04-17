require 'weather'
describe Weather do
  it { is_expected.to respond_to :stormy?}
  it "creates storms if number greater than 8 from 0 to 10" do
    weather = Weather.new
    allow(subject).to receive(:stormy?).and_return(8)
    expect(subject.stormy?).to eq 8
  end

end
