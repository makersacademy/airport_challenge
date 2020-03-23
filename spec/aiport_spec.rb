require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it 'instructs a plane to land' do
    expect (subject).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
     expect(airport).to respond_to(:take_off)
  end
end
