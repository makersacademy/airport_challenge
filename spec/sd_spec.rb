require 'sd'

describe Sd do

  it 'responds to capacity(airport, capacity)' do
    expect(subject).to respond_to(:capacity).with(2).argument
  end

end
