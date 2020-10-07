class CarrierCreator
  def factory
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def get_name
    carrier = factory
    carrier.name
  end

  def track(shipments)
    carrier = factory
    carrier.create_api_shipment_connection

    shipments.each do |shipment|
      carrier.track(shipment)
    end

    shipments
  end
end