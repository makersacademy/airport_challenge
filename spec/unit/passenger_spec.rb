require 'passenger'

describe Passenger do

  context 'creates a new passenger who has ticket and knows if on plane' do
    it { is_expected.to have_attributes(ticket: true) }
    it { is_expected.to have_attributes(on_plane: true) }
  end
  
  it 'checks if has ticket' do
    expect(subject.ticket?).to eq true
  end

  it 'knows if on a plane' do
    expect(subject.on_plane?).to be true
  end

  context 'dropping luggage' do

    it 'drops luggage' do
      subject.ticket = true
      subject.drop_luggage
      expect(subject.luggage_dropped?).to eq true
    end

    it 'prevents dropping luggage if already dropped' do
      subject.ticket = true
      subject.drop_luggage
      expect { subject.drop_luggage }.to raise_error('Luggage already dropped!')
    end

    it 'prevents dropping luggage if passenger does not have ticket' do
      subject.ticket = false
      expect { subject.drop_luggage }.to raise_error('Passenger does not have ticket!')
    end
  end

  context 'collecting luggage' do
    before(:each) do
      subject.ticket = true
      subject.drop_luggage
    end

    it 'collects luggage' do
      subject.on_plane = false
      subject.collect_luggage
      expect(subject.luggage_dropped?).to eq false
    end

    it 'prevents collecting luggage if passenger already got it' do
      subject.on_plane = false
      subject.collect_luggage
      expect { subject.collect_luggage }.to raise_error('Passenger already got luggage!')
    end

    it 'prevents collecting luggage if passenger still on plane' do
      expect { subject.collect_luggage }.to raise_error('Passenger still on plane!')
    end
  end
end
