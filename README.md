# README

Este es un microservicio para rastreo de envíos de paqueterías, se utiliza un patrón híbrido entre factory y template para que el conectar nuevas API's de paqueterías no sea un proceso engorroso, este microservicio no utiliza base de datos ya que es solo un ejercicio.

### Lenguaje y framework
Para este microservicio se utilizó:
* Ruby: 2.6.4
* Rails: 6.0.0

### Configuración necesaria en credentials.yml.enc
Para agregar esta configuración para otros ambientes, solo se replica la estructura cambiando por ejemplo `development` por `production` y se ajustan las credenciales según sea el caso.
```yml
development:
  fedex:
    attempts_number_config: 2
    api_credentials:
      key: O21wEWKhdDn2SYyb
      password: db0SYxXWWh0bgRSN7Ikg9Vunz
      account_number: 510087780
      meter: 119009727
      mode: test
  dhl:
    attempts_number_config: 3
    api_credentials:
      key: x
      password: x
      account_number: x
      meter: x
      mode: x
```
### El microservicio cuenta con 2 endpoints GET
Uno para realizar el rastreo de un envío específico y el otro para realizar un multirastreo es decir, un rastreo de multiples envíos.
* Endpoint para un solo rastreo `<url base>/fedex/shipments/449044304137821/track` al cual no se le envía un cuerpo en la petición.
* Endpoint multirastreo `<url base>/shipments/multitrack` al cual se le envía el siguiente json en el cuerpo en la petición.

  ```json
  {
    "shipments_data": [
      {
        "tracking_number": "449044304137821",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "920241085725456",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "568838414941",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "039813852990618",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "779784773617",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "779766864720",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "390321684219",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "149331877648230",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "231300687629630",
        "carrier": "FEDEX"
      },
      {
        "tracking_number": "122816215025810",
        "carrier": "FEDEX"
      }
    ]
  }
  ```
  
