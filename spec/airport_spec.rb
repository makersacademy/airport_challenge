require 'airport'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'takes off a plane' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
