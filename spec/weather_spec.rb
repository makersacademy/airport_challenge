require 'weather'

describe Weather do
  
  it 'tells the system when it is stormy' do
    allow(subject).to receive(:dice_roll) { 6 }
    expect(subject.stormy?).to be true
  end
end
