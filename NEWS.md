# rems 0.6.0

Historic data are now being updated daily in the BC Data Catalogue. This release allows the daily 
update of the sqlite historic dataset in `rems`, but it means that it must be recreated each time from the csv, which takes a while.

## Breaking changes:

* When using `attach_historic_data()`, it is now necessary to call `connect_historic_db()` first, and finish with `disconnect_historic_db()`. For example:

```r
con <- connect_historic_db()
hist_tbl <- attach_historic_data(con)

hist_tbl %>%
  select(EMS_ID, PARAMETER, COLLECTION_START, RESULT) %>%
  filter(EMS_ID == "0121580", PARAMETER == "Aluminum Total") %>%
  collect() %>%
  mutate(COLLECTION_START = ems_posix_numeric(COLLECTION_START))

disconnect_historic_db(con)
```

# rems 0.5.2

* removed internal use of `filter_` to avoid dplyr deprecation warnings. (#48)

# rems 0.5.1

* Fixed bug where currency of the historic sqlite database was checked against the wrong date
* `filter_ems_data` can now take many more forms of date-like inputs for `from_date` and `to_date` (`Date`, `POSIXct`, `POSIXlt`, `character`, `numeric`; #42)
* Added some (mainly internal) functionality to support development of the [shinyrems](https://github.com/bcgov/shinyrems) package (#43).

# rems 0.5.0

* The historic sqlite database is now available as a direct download from a rems
release on GitHub, which should be much faster and more reliable for the user.
* User can now specify/customize the location of the sqlite database via an
option `rems.historic.path`. This is best set in your `.Rprofile` file as
`options(rems.historic.path = "path_to_file")`

# rems 0.4.2

* Added new `MDL_UNIT` column to denote the units of the minimum detection limit.

# rems 0.4.1

* Added data dictionaries (lookup tables for parameters, sample classes, units, etc)
* Added `dont_update` argument to `get_ems_data()` and `download_historic_data()` to 
bypass the check to update data (#21).
* Added `lt_lake_sites()` function t get the EMS_IDs of all of the long-term lake monitoring sites (ac34dbd)
* Added `check_only` argument (default `FALSE`) to `get_ems_data()` to allow just checking the currency 
of a rems dataset (#35 @sebdalgarno)
* Added `check_db` argument (default `TRUE`) to `read_historic_data()` so that
a user can skip checking the currency of the historic dataset (#35 @sebdalgarno)


# rems 0.4.0

* Added indexes to several key columns in the 'historic' sqlite database. This makes
loading the data slower, but makes queries and the `read_historic_data` function much faster.
* Added `param_code` argument to `filter_ems_data` and `read_historic_data`
* Added PERMIT, SAMPLE_CLASS, SAMPLE_DESCRIPTOR to default `"wq"` columns
* Renamed `load_histori_data()` to `attach_historic_data()`

# rems 0.3.0

* You can now dowload the four most recent years of data, in addition to the 
most recent two years of data, as before.
      - This is a breaking change, as previous code that called 
      `get_ems_data(which = "current")` will now throw an error. It now needs to be 
      `get_ems_data(which = "2yr")` to achieve the same result as before, or it now 
      can be `get_ems_data(which = "4yr")` to get four years of data.

# rems 0.2.0

* Added new columns to data that were added in server files (#12)
* Added LOCATION_PURPOSE and SAMPLE_STATE to 'wq' columns (#13)
* Renamed `get_update_date()` to `get_cache_date()` along with some refactoring of code for getting/setting update dates (#11)
* Added `ask` parameter to `get_ems_data()` and `download_historic_data()` to optionally bypass download confirmation dialogue (#10)

# rems 0.1.2

* Fixed bug where changes in file listings in DataBC catalogue would cause errors

# rems 0.1.1

* Fixed bug where changes in file listings in DataBC catalogue would cause errors

# rems 0.1.0

* Initial release
