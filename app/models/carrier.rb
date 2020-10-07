class Carrier
  attr_accessor :shipment_client

  def name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_api_shipment_connection
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def track(shipment_id)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def self.get_api_credentials(carrier_name)
    Rails.application.credentials.dig(Rails.env.to_sym, carrier_name.to_sym)
  end
end