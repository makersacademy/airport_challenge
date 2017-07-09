require 'plane'

describe Plane do
  it 'knows it is flying' do
    expect(subject.flying?).to be(true).or be(false)
  end

  it 'knows it has landed' do
    expect(subject.landed?).to be(true).or be(false)
  end  
end
