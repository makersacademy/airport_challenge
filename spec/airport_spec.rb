require 'airport'
describe Airport do

  it 'expects airport to be empty' do
    expect(subject.planes == []).to eq true
  end

  it 'should have a default capacity of 20' do
    expect(subject.capacity == 20).to eq true
  end

end
