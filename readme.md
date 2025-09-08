#### **NEM Review contract co-design workshop**

# Contract financial performance modelling<a name="contract-financial-performance-modelling"></a>

<a name="top"></a>
<a name="contents"></a>
## Contents

* [Initial modelling approach](#initial-modelling-approach)
  * [Data profiles](#data-profiles)
  * [Existing generator locations](#existing-generator-locations)
* [Potential modelling updates](#potential-modelling-updates)
* [SA wind and solar market observations](#sa-wind-and-solar-market-observations)
  * [Size of fleet](#size-of-fleet)
  * [Capacity factors](#capacity-factors)
  * [Seasonal generation and load](#seasonal-generation-and-load)
  * [Intraday generation and load](#intraday-generation-and-load)
  * [Demand-weighted-average prices](#demand-weighted-average-prices)
  * [Spot price exposure](#spot-price-exposure)
---

## [Initial modelling approach](#initial-modelling-approach)
<a name="initial-modelling-approach"></a>

### [Data profiles](#data-profiles)
<a name="data-profiles"></a>

* All contract parties (suppliers and buyers) are in the South Australian market
* Generation and price profiles are based on historic SA data (5 years of data: 2020 to 2024)
* Suppliers include:
  - **Existing wind**: all existing utility-scale SA wind stations, scaled to 250 MW
  - **Existing solar**: all existing utility-scale SA solar stations, scaled to 250 MW
  - **Existing wind-solar hybrid**: Port Augusta Renewable Energy Park wind and solar profile, scaled to 250 MW each of wind/solar
* Buyers' demand reflects the SA load profile

### [Existing generator locations](#existing-generator-locations)
<a name="existing-generator-locations"></a>

* 26 wind generators
* 16 solar generators

![Existing SA generator locations](./charts/sa_generator_locations.png)

[Back to top](#top)

---

## [Potential modelling updates](#potential-modelling-updates)
<a name="potential-modelling-updates"></a>

* Incorporate hybrid stations:
  * **Wind-battery hybrid**: A hypothetical station with wind profile based on Hornsdale 3, scaled to 250 MW with 100 MW (200 MWh) battery
  * **Solar-battery hybrid**: A hypothetical station wind profile based on Bungala 2, scaled to 250 MW with 100 MW (200 MWh) battery
* Hybrid stations' battery behaviour will be based on heuristics, prioritising defence of the station's contract position
* Incorporate seasonal generation data from AEMO's Generation Information, with contracts tailored to varying maximum capacities
* Expand modelling to all NEM regions
* Synthesise generation and price data to test contracts against a wider range of outcomes

[Back to top](#top)

---

## [SA wind and solar market observations](#sa-wind-and-solar-market-observations)
<a name="sa-wind-and-solar-market-observations"></a>

### [Size of fleet](#size-of-fleet)
<a name="size-of-fleet"></a>

**Maximum capacity** (MW, 2020 to 2024 – monthly changes)

![Size of SA wind and solar fleet](./charts/growth_of_sa_fleet.png)
[Back to section top](#sa-wind-and-solar-market-observations)

### [Capacity factors](#capacity-factors)
<a name="capacity-factors"></a>

Generator capacity factors are calculated from dispatched output rather than availability. The aggregate fleet capacity factors over the 5 years analysed are:
* Solar: **19.4%**
* Wind: **30.6%**

**Distributions of generator capacity factors**

![Distribution of capacity factors](./charts/sa_fleet_capacity_factors.png)

[Back to section top](#sa-wind-and-solar-market-observations)

### [Seasonal generation and load](#seasonal-generation-and-load)
<a name="seasonal-generation-and-load"></a>

**Mean quarterly generation (availability)** (MW, 2020 to 2024)

![Mean quarterly SA availability](./charts/sa_mean_quarterly_generation.png)

**Mean quarterly load** (MW, 2020 to 2024)

![Mean quarterly SA Load](./charts/sa_mean_quarterly_load.png)

[Back to section top](#sa-wind-and-solar-market-observations)

### [Intraday generation and load](#intraday-generation-and-load)
<a name="intraday-generation-and-load"></a>

[Back to section top](#sa-wind-and-solar-market-observations)

### [Demand-weighted-average prices](#demand-weighted-average-prices)
<a name="demand-weighted-average-prices"></a>

Demand-weighted-average prices are weighted by:
* Total demand (or operational demand) for the SA market price
* Availability for solar and wind generation

**Quarterly demand-weighted-average prices** ($/MWh, 2020 to 2024)

![Quarterly demand-weighted-average prices](./charts/dwa_prices_sa_quarterly.png)

[Back to section top](#sa-wind-and-solar-market-observations)

### [Spot price exposure](#spot-price-exposure)
<a name="spot-price-exposure"></a>

[Back to section top](#sa-wind-and-solar-market-observations)

[Back to top](#top)