require 'airport'

describe Airport do
  it 'can create a instance' do
    expect(Airport.new).to be_truthy
  end
  it 'has a collection planes' do
    is_expected.to respond_to(:planes)
    expect(subject.planes).to eq []
  end

end
