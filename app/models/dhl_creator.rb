class DhlCreator < CarrierCreator
  def factory(shipments)
    SkyDhl.new(shipments)
  end
end