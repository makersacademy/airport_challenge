require 'airport'

RSpec.describe Airport do
  
  it 'creates an instance of an Airport' do
    expect(subject).not_to eq(nil)
  end

  it { is_expected.to respond_to :full }

  it 'has a default capacity of 50 airplanes' do 
    expect(subject.capacity).to eq(50)
  end
end