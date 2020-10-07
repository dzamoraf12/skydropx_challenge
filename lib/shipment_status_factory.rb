module ShipmentStatusFactory
  def get_approved_status(status)
    case status
    when "Shipment information sent to FedEx", "At Pickup"
      "CREATED"
    when "At FedEx destination facility", "At destination sort facility", 
      "Departed FedEx location", "On FedEx vehicle for delivery"
      "ON_TRANSIT"
    when "Delivered"
      "DELIVERED"
    when "This tracking number cannot be found. Please check the number or contact the sender."
      "EXCEPTION"
    else
      "Estatus no reconocido: '#{status}'"
    end
  end
end