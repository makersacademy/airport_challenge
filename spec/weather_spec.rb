require 'weather'

describe Weather do

  it 'tells the system when it is stormy' do
    expect(subject.stormy?).not_to be_nil
  end
end
