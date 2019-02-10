require_relative "../lib/weather"

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it '#stormy returns true if the random number is 0' do
    
 
    # allow(Weather).to receive(:stormy?).and_return true 
    # allow(stormy?).to receive(:rand)
    # expect(subject(rand(3)).stormy?). to eq true
  end
end
