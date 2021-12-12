require 'airport'

describe Airport do
  it 'lets a plane land' do
    #subject = Airport
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lets plane take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end