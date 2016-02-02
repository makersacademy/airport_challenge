require 'aircraft'

describe Aircraft do
  subject(:Aircraft) { described_class.new }

  describe ' #take_off' do

    it 'should provide a confirmation when plane has taken off.' do
      if subject.landed? == false
        expect(subject.status).to eq 'STATUS: IN FLIGHT'
      end
    end


  end

  describe ' #landing' do

    it { should respond_to(:landed?) }

    it 'should provide a confirmation when plane has landed.' do
      if subject.landed? == true
        expect(subject.status).to eq 'STATUS: LANDED'
      end
    end

  end

end
