class SkyFedex < Carrier
  def name
    "FedEx"
  end

  def create_api_shipment_connection
    self.shipment_client = Fedex::Shipment.new(SkyFedex.get_api_credentials("fedex"))
  end

  def track(shipment)
    results = self.shipment_client.track(tracking_number: shipment.tracking_number)
    shipment_data = results.first
    shipment.status = shipment_data.status
    shipment.events = shipment_data.events
    shipment.success_tracking = true
  rescue Fedex::RateError => e
    shipment.success_tracking = true if e.message.include? "cannot be found"
    shipment.status = e.message
  end
end