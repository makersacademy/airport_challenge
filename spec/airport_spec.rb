require 'airport'

describe Airport do
  it 'lets a plane land' do
    #subject = Airport
    expect(subject).to respond_to(:land).with(1).argument
  end
end