class CarrierCreator
  def factory(shipments)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def get_name
    carrier = factory([])
    carrier.name
  end

  def track(shipments)
    carrier = factory(shipments)
    carrier.create_api_shipment_connection
    carrier.set_track_attempts_number

    carrier.shipments.each do |shipment|
      carrier.track_attempts_number.times do |i|
        p "intento de rastreo #{i + 1} de #{carrier.track_attempts_number}"
        carrier.track(shipment)
        break if shipment.success_tracking
      end
    end

    carrier.shipments
  end
end