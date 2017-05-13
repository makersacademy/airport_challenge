require 'weather'

describe Weather do
  it 'should respond to #current_state' do
    expect(subject).to respond_to(:current_state)
  end
  it 'should return either "good" or "stormy" when #current_state is called on it' do
    expect([:good, :stormy].include?(subject.current_state)).to eq true
  end
end
