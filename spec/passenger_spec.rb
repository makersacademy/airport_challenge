require 'passenger'
require 'ticket'
require 'luggage'

describe Passenger do
  it 'checks if has ticket' do
    expect(subject.ticket?).to eq true
  end

  context 'dropping luggage' do
    before(:each) do
      @luggage = Luggage.new
    end

    it 'drops luggage' do
      subject.ticket = true
      subject.drop_luggage(@luggage)
      expect(subject.luggage_dropped?(@luggage)).to eq true
    end

    it 'prevents dropping luggage if already dropped' do
      subject.ticket = true
      subject.drop_luggage(@luggage)
      expect { subject.drop_luggage(@luggage) }.to raise_error('Luggage already dropped!')
    end

    it 'prevents dropping luggage if passenger does not have ticket' do
      subject.ticket = false
      expect { subject.drop_luggage(@luggage) }.to raise_error('Passenger does not have ticket!')
    end
  end

  context 'getting luggage' do
    before(:each) do
      @luggage = Luggage.new
      subject.ticket = true
      subject.drop_luggage(@luggage)
      subject.get_luggage(@luggage)
    end
  
    it 'gets luggage' do
      expect(subject.luggage_dropped?(@luggage)).to eq false
    end

    it 'prevents getting luggage if passenger already got it' do
      expect { subject.get_luggage(@luggage) }.to raise_error('Passenger already got luggage!')
    end
  end
end
