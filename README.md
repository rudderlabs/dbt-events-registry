# Events Registry using DBT and RudderStack

This repository contains a sample DBT project for Rudder stack. It can be applied on Rudder data residing in BigQuery. 

## Overview

This DBT project is built on top of the source table `tracks` which is created by default in all the RudderStack warehouse destinations. 

The `Events Registry` table essentially contains information like `first triggered time`, `last triggered time` and aggregates `like 
total count`, `total user count` and `daily average` corresponding to each type of event routed via the RudderStack SDK(s).

The `Events Registry Last N Days` table creates the same aggregates as above with the only difference being that it is for records up till 
N days in the past. The value of N can be changed in the query. The resulting table will remain the same; there is an attribute 
`window-width`which will show the value of N used to generate the record. Since the data in the N Days table is for a limited time 
window and not for the entire lifecyle of the RudderStack installation - `first_triggered_time` and `last_triggered_time` are not
applicable in this case.

## How to Use This Repository

This project was created on the [**DBT Cloud**](https://cloud.getdbt.com). Hence, there is no `profiles.yml` file with the connection information. 

Developers who want to execute the models on the Command Line Interface (CLI) mode will need to create additional configuration files 
following the directions provided [**here**](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/)

There is only one model to be built - `dbt_event_registry`

**Important**: Please remember to change `schema` in `tracks.yml`, `dbt_event_registry.sql` and `dbt_event_registry_last_N_days` to your database schema.
