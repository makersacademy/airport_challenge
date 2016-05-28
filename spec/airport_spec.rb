require 'airport'

describe Airport do

  it 'require airplane to land' do
    expect(subject).to respond_to :require_land
  end

  it 'require airplane to take off' do
    expect(subject).to respond_to :require_take_off
  end

end
