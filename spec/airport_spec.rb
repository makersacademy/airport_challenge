require 'airport'

describe Airport do

  it 'should land plane in airport' do 
    expect(subject).to respond_to :land?
  end
    
  it 'should take off and confirm to airport' do
    expect(subject).to respond_to(:takeoff?).with(1).argument
  end

  it 'should not land plane if airport is full' do
    expect(subject).to respond_to(:isairportfull)
  end

  it 'raises an error saying it cannot land plane' do
      expect {subject.}
  end

end
