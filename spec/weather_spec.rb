require 'weather'

shared_examples_for 'weather' do

  subject {described_class.new}

  before do #don't let zeus upset our tests, ensure sun every day!
    allow(subject).to receive(:rand).and_return(1)
  end

  it "is stormy when zeus decides" do
    allow(subject).to receive(:zeus) {:stormy}
    expect(subject.stormy?).to eq(true)
  end

  it "is not stormy when zeus decides" do
    allow(subject).to receive(:zeus) {:sunny}
    expect(subject.stormy?).to eq(false)
  end

  it "stops planes taking off when stormy" do
    allow(subject).to receive(:stormy?) {true}
    expect{subject.take_off}.to raise_error "stormy day, no flying"
  end
end
