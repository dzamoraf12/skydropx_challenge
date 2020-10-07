class DhlCreator < CarrierCreator
  def factory
    SkyDhl.new
  end
end