require 'plane'

describe PLANE do

  it 'logs airline name upon landing request to control tower' do
    plane=PLANE.new('virgin')
    expect(plane.airline).to eq 'virgin'
  end
end
