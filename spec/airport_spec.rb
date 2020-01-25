require 'airport'
require 'plane'
require 'spec_helper'


describe Airport do
  it { should respond_to(:take_off).with(1).argument }
  it { should respond_to(:land).with(1).argument }
  

  describe '#land' do
    
    it 'raises error when airport full' do
      10.times { subject.land(Plane.new) }
      expect{ subject.land(Plane.new) }.to raise_error 'no space here sorry'
    end
  end

end
 
