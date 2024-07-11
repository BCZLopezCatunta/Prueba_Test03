Feature: Gestión de Vehículos
  Verificar el registro, modificación y búsqueda de vehículos en el sistema.

  Background:
    Given que tengo acceso al sistema como administrador

  Scenario: Registrar un nuevo vehículo exitosamente
    When registro un nuevo vehículo con los siguientes datos:
      | Placa     | Precio Hora | Precio Día | Precio Mes | Modelo  | Kilometraje | Transmisión | Asientos | Equipaje | Combustible | Imagen      | Tipo | Marca |
      | ABC123    | 10          | 50         | 300        | Modelo1 | 10000       | Automática  | 5        | Grande   | Gasolina    | vehiculo.jpg | 1    | 1     |
    Then debería ver el mensaje "Vehículo registrado correctamente."

  Scenario: Intento de registrar un vehículo que ya existe
    When intento registrar un nuevo vehículo con los siguientes datos:
      | Placa     | Precio Hora | Precio Día | Precio Mes | Modelo  | Kilometraje | Transmisión | Asientos | Equipaje | Combustible | Imagen      | Tipo | Marca |
      | XYZ789    | 15          | 60         | 350        | Modelo2 | 8000        | Manual      | 4        | Mediano  | Diésel      | carro.jpg   | 2    | 2     |
    Then debería ver el mensaje "Ya existe un vehículo con esa placa."

  Scenario: Falla en el registro de un nuevo vehículo
    When intento registrar un nuevo vehículo con datos incorrectos
    Then debería ver el mensaje "Ocurrió un error al intentar registrar el vehículo."

  Scenario: Modificar un vehículo existente
    Given existe un vehículo con id 1
    When modifico el vehículo con id 1 con los siguientes datos:
      | Placa     | Precio Hora | Precio Día | Precio Mes | Modelo  | Kilometraje | Transmisión | Asientos | Equipaje | Combustible | Imagen      | Tipo | Marca |
      | ABC123    | 12          | 55         | 320        | Modelo1 | 12000       | Automática  | 5        | Grande   | Gasolina    | vehiculo.jpg | 1    | 1     |
    Then debería ver el mensaje "Vehículo modificado correctamente."

  Scenario: Falla al intentar modificar un vehículo
    Given existe un vehículo con id 2
    When intento modificar el vehículo con id 2 con datos incorrectos
    Then debería ver el mensaje "Ocurrió un error al intentar modificar el vehículo."

  Scenario: Buscar vehículo por placa, tipo o marca
    Given existen vehículos registrados en el sistema
    When busco vehículos con el valor "ABC" en la búsqueda
    Then debería ver resultados de búsqueda con vehículos que coincidan con "ABC"

  Scenario: Cambiar estado de un vehículo
    Given existe un vehículo con id 1
    When cambio el estado del vehículo con id 1 a "2"
    Then debería ver el mensaje "Estado del vehículo cambiado correctamente."
