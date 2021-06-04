require 'atc'

describe Airport do
  it 'Allows user to set custom airport size' do
    expect(subject.custom_size(10)).to eq(10)
  end
end
