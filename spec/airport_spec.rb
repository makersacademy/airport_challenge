require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  it 'creates new airports' do
    expect(:airport).to eq(:airport)
  end

  it 'accepts landed planes' do
    subject.land(:plane)
    expect(subject.landed).to be true
  end

  it 'lets planes take-off' do
    expect(subject.depart(:plane)).to be false
  end

  it 'initializes a planes array when airport is instantiated' do
    airport = Airport.new
    expect(subject.planes).to be_an_instance_of(Array)
  end

  it 'initializes the location to be false upon instantiation' do
    airport = Airport.new
    expect(subject.landed).to be false
  end

 describe '#land' do
   it 'adds a plane to the planes array when landed' do
    subject.land(:plane)
    expect(subject.planes).to eq [:plane]
  end

  it 'will not land a plane that is already landed' do
    subject.land(:plane)
    expect {subject.land(:plane)}.to raise_error("You can't land this plane again!")
  end


   it 'removes a plane from the planes array when taken-off' do
    subject.depart(:plane)
    expect(subject.planes).to eq []
  end

end





end
