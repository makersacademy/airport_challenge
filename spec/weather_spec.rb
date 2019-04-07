require 'weather'

describe Weather do
  it 'should respond to #storm?' do
    expect(subject).to respond_to :storm?
  end
end
