module Weather

  def is_stormy?
    Kernel.rand(100) < 10
  end

end
