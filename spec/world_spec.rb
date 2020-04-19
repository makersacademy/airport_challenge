require 'world'
require 'air'

describe World do

  it 'responds to add' do
    expect(subject).to respond_to(:add).with(1).arguments
  end
  
  it 'returns true or false' do
    air = Air.new
    expect(subject.add(air)).to eq(true).or eq(false)
  end
  
end
