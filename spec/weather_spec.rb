require 'weather'

describe Weather do
  it 'should respond to #current_state' do
    expect(subject).to respond_to(:current_state)
  end
end
