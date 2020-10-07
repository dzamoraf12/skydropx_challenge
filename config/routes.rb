Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get ":carrier/shipments/:tracking_number/track" => "shipments#track"
  get "shipments/multitrack" => "shipments#multitrack"
end
