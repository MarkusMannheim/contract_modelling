#### **NEM Review contract co-design workshop**

# Contract financial performance modelling<a name="contract-financial-performance-modelling"></a>

<a name="top"></a>
<a name="contents"></a>
## Contents

* [Initial modelling approach](#initial-modelling-approach)
  * [Data profiles](#data-profiles)
  * [Existing generators](#existing-generators)
* [Potential modelling updates](#potential-modelling-updates)
* [Wind and solar market observations](#wind-and-solar-market-observations)
  * [Size of fleets](#size-of-fleets)
  * [Capacity factors](#capacity-factors)
  * [Seasonal generation and load](#seasonal-generation-and-load)
  * [Intraday generation and load](#intraday-generation-and-load)
  * [Volume-weighted average prices](#volume-weighted-average-prices)

---

## [Initial modelling approach](#initial-modelling-approach)
<a name="initial-modelling-approach"></a>

### [Data profiles](#data-profiles)
<a name="data-profiles"></a>

* Contract parties (suppliers and buyers) are from each NEM region
* Generation and price profiles are based on 5 years of historic data (2020 to 2024)
* Suppliers include:
  - **Existing wind**: all existing utility-scale wind stations that were operating on 1 January 2020, scaled to 250 MW
  - **Existing solar**: all existing utility-scale solar stations that were operating on 1 January 2020, scaled to 250 MW
  - **Existing wind-solar hybrid**: Port Augusta Renewable Energy Park wind and solar profile, scaled to 250 MW each of wind/solar
* Buyer's demand reflects the demand profile of the buyer's region

### [Existing generators](#existing-generators)
<a name="existing-generators"></a>

78 generators in the NEM meet the above criteria (i.e. 5 full years of generation):

| Region | Wind | Solar |
|-|-|-|
| NSW | 10 | 12 |
| QLD | 2 | 19 |
| SA | 16 | 3 |
| VIC | 11 | 5 |

### [Contract concepts](#contract-concepts)
<a name="contract-concepts"></a>

The following contract concepts, for suppliers and buyers, will be modelled (this list will likely expand):
* PPAs
* Baseload swaps
* Caps
* Wind DWA swap
* Solar DWA swap
* ToD blocks (including ASX morning and evening peaks)
* DWA-TWA spreads

[Back to top](#top)

---

## [Potential modelling updates](#potential-modelling-updates)
<a name="potential-modelling-updates"></a>

* Incorporate hybrid stations:
  * **Wind-battery hybrid**: A hypothetical station with wind profile based on Hornsdale 3, scaled to 250 MW with 100 MW (200 MWh) battery
  * **Solar-battery hybrid**: A hypothetical station wind profile based on Bungala 2, scaled to 250 MW with 100 MW (200 MWh) battery
* Hybrid stations' battery behaviour will be based on heuristics, prioritising defence of the station's contract position
* Incorporate seasonal generation data from AEMO's Generation Information, with contracts tailored to varying maximum capacities
* Synthesise generation and price data to test contracts against a wider range of outcomes
* Incorporate all NEM regions

[Back to top](#top)

---

## [Wind and solar market observations](#wind-and-solar-market-observations)
<a name="wind-and-solar-market-observations"></a>

### [Size of fleets](#size-of-fleets)
<a name="size-of-fleets"></a>

**Maximum capacity** (MW, 2020 to 2024 – monthly changes)

![Size of wind and solar fleets](./charts/growth_of_fleet.png)
[Back to section top](#wind-and-solar-market-observations)

### [Capacity factors](#capacity-factors)
<a name="capacity-factors"></a>

Generator capacity factors are calculated from dispatched output (net of curtailment). The aggregate fleet capacity factors over the 5 years analysed are:

| Region | Wind | Solar |
|-|-|-|
| NSW | 29.4% | 20.9% |
| QLD | 30.3% | 20.6% |
| SA | 30.6% | 19.4% |
| VIC | 26.7% | 18.8% |

**Distributions of generator capacity factors**

![Distribution of capacity factors](./charts/fleet_capacity_factors.png)

[Back to section top](#wind-and-solar-market-observations)

### [Seasonal generation and load](#seasonal-generation-and-load)
<a name="seasonal-generation-and-load"></a>

**Mean quarterly generation** (MW, 2020 to 2024)

![Mean quarterly generation](./charts/mean_quarterly_generation.png)

**Mean quarterly load** (MW, 2020 to 2024)

![Mean quarterly Load](./charts/mean_quarterly_load.png)

[Back to section top](#wind-and-solar-market-observations)

### [Intraday generation and load](#intraday-generation-and-load)
<a name="intraday-generation-and-load"></a>

**Mean intraday generation per 30-minute interval** (MW, 2020 to 2024)

![Mean intraday generation per 30-minute interval](./charts/mean_intraday_generation.png)

**Mean intraday load per 30-minute interval** (MW, 2020 to 2024)

![Mean intraday load per 30-minute interval](./charts/mean_intraday_load.png)

[Back to section top](#wind-and-solar-market-observations)

### [Volume-weighted average prices](#volume-weighted-average-prices)
<a name="volume-weighted-average-prices"></a>

Volume-weighted average prices are weighted by:
* Total demand (operational demand) for the SA market price
* Dispatched output (net of curtailment) for solar and wind generation

**Quarterly volume-weighted average prices** ($/MWh, 2020 to 2024)

![Quarterly volume-weighted average prices](./charts/vwa_prices_quarterly.png)

[Back to section top](#wind-and-solar-market-observations)

[Back to top](#top)