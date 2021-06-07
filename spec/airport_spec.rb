require 'atc'

describe Airport do
  it 'Allows user to set custom airport size' do
    expect(subject.custom_size(10)).to eq(10)
  end

  it 'creates airport size' do
    test = Airport.new
    test2 = test.custom_size(20)
    #test.airport_size
    expect(test2).to eq(20)
  end
end
