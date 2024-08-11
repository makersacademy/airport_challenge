module Weather

  def stormy?
    Kernel.rand(0..100) > 95
  end
  
end
