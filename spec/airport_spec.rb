require 'airport'

describe Airport do

  it {is_expected.to(respond_to(:land?))}

  it {is_expected.to(respond_to(:take_off?))}

  it {is_expected.to(respond_to(:stormy))}

  it 'does not allow planes to land when the weather is stormy' do
    expect {subject.land?}.to raise_error 'The weather is stormy, cannot land.'
  end

  it 'does not allow planes to take off when the weather is stormy' do
    expect {subject.take_off?}.to raise_error 'The weather is stormy, cannot take_off.'
  end

end
