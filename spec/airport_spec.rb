require 'airport'
describe Airport do
  it 'starts with no planes' do
    expect(subject.planes).to eq []
  end
end
