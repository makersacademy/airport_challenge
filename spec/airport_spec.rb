require "./lib/airport.rb"
require "./lib/airplane.rb"

describe Airport do
  
  describe '#land' do
    it 'responds to the instruction to land a plane' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'instructs the plane to #land' do
      airplane = Airplane.new
      #subject.land(airplane)
      expect(subject.land(airplane)).to eq [airplane]
    end

  end

  describe '#take_off' do
    it 'responds to the instruction to take off' do
      expect(subject).to respond_to(:take_off)
    end

    #it 'instructs the plane #to take_off' do
      #airplane = Airplane.new
      #airplane = subject.take_off
      #expect(bike).to 
    #end
  end
end