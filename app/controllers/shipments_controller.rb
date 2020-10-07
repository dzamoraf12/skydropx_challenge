class ShipmentsController < ApplicationController
  def track
    shipments_data = execute_track(track_params)

    render json: shipments_data.flatten.first, status: 200
  end

  def multitrack
    shipments_data = execute_track(multitrack_params)

    render json: shipments_data.flatten, status: 200
  end

  def execute_track(tracking_params)
    shipments_data = []

    shipments_by_carrier = Shipment.build_from_json_array(tracking_params)
    shipments_by_carrier.each do |carrier_name, shipments|
      carrier = carrier_creator(carrier_name)
      shipments_data << carrier.track(shipments)
    end

    shipments_data
  end

  def carrier_creator(carrier_name)
    case carrier_name.downcase
    when "fedex"
      FedexCreator.new
    when "dhl"
      DhlCreator.new
    else
      raise NotImplementedError, "Carrier '#{carrier_name}' not implemented"
    end
  end

  def track_params
    [
      {
        carrier: params[:carrier],
        tracking_number: params[:tracking_number]
      }
    ]
  end

  def multitrack_params
    params.require(:shipments_data)
  end
end
