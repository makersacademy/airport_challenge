require 'airport'

describe Airport do

  it 'will respond to land' do
    expect(Airport.new).to respond_to(:land)
  end

  it 'will give planes permission to land' do
    expect(subject.land).to eq("Cleared to land")
  end

  it 'will respond to take off' do
    expect(Airport.new).to respond_to(:take_off)
  end

  it 'will instruct a plane to take off' do
    expect(subject.take_off).to eq("Cleared for take off")
  end

end
