require 'airport'

describe Airport do
  it 'can create an instance of itself' do
    expect(subject).to be_kind_of(Airport)
  end

  it 'it responds to a land method - enabling flights to land' do 
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to a method take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
  
end