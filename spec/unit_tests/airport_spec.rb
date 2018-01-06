require 'airport'

describe Airport do

  describe '#land' do

    it 'airport should respond to land method' do
     expect(subject).to respond_to(:land)
   end

    it 'should add plane to an array when given as argument' do
    expect(subject.land("plane")).to eq ["plane"]
    end

  end

end
