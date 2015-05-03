class Plane
  def flying?
    true
    xit { is_expected.to respond_to :flying?}

  	xit 'can be landed'
  	subject.land
  	expect(subject).not_to be_flying
  	
  end
end
