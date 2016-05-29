require 'airport'
require 'plane'

describe Airport do

  it { should be_instance_of(Airport) }

  it { is_expected.to respond_to(:stored_planes) }

  it { is_expected.to respond_to(:full?) }

  it { is_expected.to respond_to(:store).with(1).argument }

 describe '#store planes' do
   it 'airport is empty if no planes have landed' do
    expect(subject.stored_planes).to eq([])
  end
end

end