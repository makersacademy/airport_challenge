require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  context 'good weather'do
    it 'confirms plane has landed' do
      expect { subject.land(plane) }.to output("#{plane} has landed").to_stdout
    end

    it 'confirms plane is no longer in airport' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect { subject.take_off(plane) }.to output("#{plane} is no longer in airport").to_stdout
    end
  end

  context 'stormy weather' do
    it 'prevents take off' do
      allow(subject).to receive(:stormy?).and_return(true) # stub!
      expect{ subject.take_off(plane) }.to raise_error "Cannot take off due to stormy conditions!"
    end
  end

end
