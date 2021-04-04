require 'airport'
describe Airport do
  it 'change capacity of airport' do
    expect(subject.change_capacity(30)).to eq(30)
  end  
end
