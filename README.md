# GeoTaskTracker

Geo-based tasks tracker.
This is a solution to a [task explained here](./TASK.md).

Simplifications due to the nature of the job application:
- no API documentation;
- auth tokens are plain strings stored in DB;
- path to task assumed to be a straight line.

TODO:
- decent test coverage;
- describe error in respond on request failure;
- setup prod environment and deploy configs;
- fix compile warnings;
- make sure DB index works alright;
- make all migrations reversible;
- send metrics (e.g. to InfluxDB);
- report errors (e.g. to Sentry);
- setup logging to file for prod environment;
- tighten DB column data types;
- see a possible simplification with accessing geometry fields as a struct
instead of PostGIS getters;
- probably a Phoenix bug: Ecto.Enum error message is not supported by default
ErrorHelpers.translate_error/1;

## Dev setup:

* Setup DB with PostGIS:
    ```
    sudo apt-get install postgresql-13-postgis-3
    mix ecto.create

    sudo -u postgres psql geo_task_tracker_dev
    # In psql:
    create extension if not exists plpgsql;
    create extension postgis;

    mix ecto.migrate
    mix run priv/repo/seeds.exs
    ```
* (Optional) install GUI application for viewing Geo data:
    ```
    sudo apt install qgis
    ```
* (Optional) install httpie to use with examples in "API usage" section:
    ```
    sudo apt install httpie
    ```

## API usage
### Driver:
List nearby (1 km) tasks:
```
http localhost:4000/api/v1/tasks Authorization:"Bearer some_valid_driver_token" lon==55 lat==56
```
Change task status:
```
http PATCH localhost:4000/api/v1/tasks/1 Authorization:"Bearer some_valid_driver_token" status=done
```

### Manager:
Create task:
```
http post localhost:4000/api/v1/tasks Authorization:"Bearer some_valid_manager_token" pickup:='{"lon": 55, "lat": 56}' delivery:='{"lon": 66, "lat": 67}'
```

### Tokens provided with seeds:
```
some_valid_driver_token
another_valid_driver_token
some_valid_manager_token
another_valid_manager_token
```