class FedexCreator < CarrierCreator
  def factory(shipments)
    SkyFedex.new(shipments)
  end
end