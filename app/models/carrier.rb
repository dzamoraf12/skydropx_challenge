class Carrier
  attr_accessor :shipment_client, :track_attempts_number

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
    Rails.application.credentials.dig(Rails.env.to_sym, carrier_name.to_sym, :api_credentials)
  end

  def set_track_attempts_number
    track_attempts_number = Rails.application.credentials.dig(Rails.env.to_sym, self.name.downcase.to_sym, :attempts_number_config)
    if track_attempts_number.blank?
      self.track_attempts_number = 1
    else
      self.track_attempts_number = track_attempts_number
    end
  end
end