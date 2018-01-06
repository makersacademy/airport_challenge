require 'airport'

describe Airport do

  describe '#land' do

    it 'aiport should respond to land method' do
     expect(subject).to respond_to(:land)
   end

    it 'should let planes land' do
    expect(subject.land("plane")).to eq ["plane"]
    end

  end

end
