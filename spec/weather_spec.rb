require 'weather'

describe Weather do
  it { is_expected.to respond_to(:is_stormy) }

  it 'should return either true or false for #is_stormy' do
    expect(subject.is_stormy).to satisfy { |stormy| stormy == true || stormy == false}
  end
  
end
