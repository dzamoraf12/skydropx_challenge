class SkyDhl < Carrier
  def name
    "DHL"
  end

  def create_api_shipment_connection
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def track(shipment_id)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end