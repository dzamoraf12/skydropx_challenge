class FedexCreator < CarrierCreator
  def factory
    SkyFedex.new
  end
end