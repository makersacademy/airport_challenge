require 'weather'


describe Weather do

  it 'returns a new storm' do
    allow(Weather).to receive(:stormy?).and_return(true)
   end
end
