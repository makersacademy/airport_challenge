require 'airport'
describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it 'change capacity of airport' do
    expect(subject.change_capacity(30)).to eq(30)
  end  
end
