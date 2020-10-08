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
