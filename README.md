# Events Registry using DBT and RudderStack

This repository contains a sample DBT project for Rudder stack. It can be applied on Rudder data residing in BigQuery. 

This DBT project builds on top of the source table "tracks" which is created by default in all Rudder warehouse destinations. 

The Events Registry table essentially contains aggregated information like first triggered time, last triggered time, total count 
and total user count corresponding to each type of event routed via Rudder SDK(s).

This project was created on [**DBT Cloud**](https://cloud.getdbt.com). Hence there is no profiles.yml file with connection information. 
Developers who want to execute the models in Command Line Interface (CLI) mode will need to create additional configuration files 
following the directions provided [**here**](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/)

There is only one model to be built - `dbt_event_registry`

**Please remember to change `schema` in `tracks.yml` and `dbt_event_registry.sql` to your database schema**
