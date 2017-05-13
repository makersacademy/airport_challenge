require 'weather'

describe Weather do
  it 'should respond to #current_state' do
    expect(subject).to respond_to(:current_state)
  end
  it 'should return either "good" or "stormy" when #current_state is called on it' do
    expect([:good, :stormy].include?(subject.current_state)).to eq true
  end
  it 'should respond to #safe?' do
    expect(subject).to respond_to(:safe?)
  end
  it 'should return true if weather is good and #safe is called on it' do
    #This test needs to be updated with correct reacting stub as soon as random weather generator is implemented
    expect(subject.safe?).to eq true
  end
end
