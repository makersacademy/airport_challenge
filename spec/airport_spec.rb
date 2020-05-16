require 'airport'

describe Airport do
  subject { Airport.new }

  context 'landing' do
    it 'airport responds to land method and takes an argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'adds the plane to the airport class' do
      expect(subject.land('plane')).to eq('plane')
    end 

  end

end
