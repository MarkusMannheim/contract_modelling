# Contract financial performance modelling

### **NEM Review contract co-design workshop**

## Initial modelling approach

### Data profiles

* All contract parties – suppliers and buyers – are in the South Australian market
* Generation and price profiles are based on historic SA data (5 years of data: 2020 to 2024)
* Suppliers include:
  - **Existing wind**: 26 large-scale SA wind stations, scaled to 250 MW
  - **Existing solar**: 19 large-scale SA solar stations, scaled to 250 MW
  - **Existing wind-solar hybrid**: Port Augusta Renewable Energy Park wind and solar profile, scaled to 250 MW each of wind/solar

### Existing generator locations

![Generator locations](./charts/sa_generator_locations.png)

## Potential modelling updates

* Incorporate hydrid stations: 
  - **Wind-battery hydrid**: A hypothetical station with wind profile based on Hornsdale 3, scaled to 250 MW with 100 MW (200 MWh) battery
  - **Solar-battery hydrid**: A hypothetical station wind profile based on Bungala 2, scaled to 250 MW with 100 MW (200 MWh) battery
* Hybrid stations' battery behaviour will be based on heuristics, prioritising defence of the station's contract position
* Incorporate seasonal generation data from AEMO's Generation Information, with contracts tailed to varying maximum capacities 
* Expand modelling to all NEM regions
* Synthesise generation and price data to test contracts against a wider range of outcomes

## Observations of SA wind and solar market

### Size (capacity) of fleet

![Generator locations](./charts/growth_of_sa_fleet.png)

### Capacity factors

Aggregate fleet CF over the 5 years:
* Solar: **19.4%**
* Wind: **30.6%**

Individual generator CFs are shown below:

![Generator locations](./charts/sa_fleet_capacity_factors.png)

