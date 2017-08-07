require 'airport'

describe Weather do

  it 'should respond to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

end