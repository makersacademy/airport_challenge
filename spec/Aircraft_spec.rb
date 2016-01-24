require 'aircraft'

describe Aircraft do
  subject(:Aircraft) { described_class.new }

  describe '#landing' do

    it { should respond_to(:landed?) }

    it 'should provide a confirmation when plane has landed.' do
      if subject.landed? == true
        expect(subject.landed?).to eq 'SUCCESSFUL LANDING CONFIRMATION'
      end
    end

  end

end
