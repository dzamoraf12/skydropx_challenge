class Shipment
  attr_reader :carrier, :tracking_number
  attr_accessor :status, :events
  
  def initialize(attributes = {})
    @carrier = attributes[:carrier]
    @tracking_number = attributes[:tracking_number]
  end

  def self.build_from_json_array(json_array)
    result = { }
    json_array.each do |json_shipment|
      shipment = Shipment.new({
        carrier: json_shipment[:carrier],
        tracking_number: json_shipment[:tracking_number]
      })

      result.store(json_shipment[:carrier], [ ]) if result[json_shipment[:carrier]].nil?
      result[json_shipment[:carrier]] << shipment
    end

    result
  end
end