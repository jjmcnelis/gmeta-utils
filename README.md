# gmeta-utils

>a structured interface to common geodata utils (gdal + ogr + nco)

*go straight to **[`TEST.md`](TEST.md)** to see what goes in and what comes out.*

**Key features:**

* consistent input: `gmeta [util] [args:ordered] keyword=[arg:optional] [file]`
* consistent output: *json* or *comma separated list*

Each of these should work for most raster, vector, multidim, and text formats:

```shell
$ gmeta info [FILE]
$ gmeta count [FILE]
$ gmeta list [FILE]
$ gmeta find [FILE] var=[ match regular expression or substring]
```

See the tests and their outputs in [`TEST.md`](TEST.md). The test files are in [tests/](tests/) and the test script is in [docs/test.sh](docs/test.sh):

* raster: [tests/snowmelt_Timing_North_America_2001.tif](tests/snowmelt_Timing_North_America_2001.tif)
* vector: [tests/ABoVE_240mgrid_tiles.shp](tests/ABoVE_240mgrid_tiles.shp)
* multidim: [tests/daymet_v3_tmin_monavg_2017_hi.nc](tests/daymet_v3_tmin_monavg_2017_hi.nc)
* text: [tests/FLUXNET_Canada_Site_Information.csv](tests/FLUXNET_Canada_Site_Information.csv)

**run using docker image**

Same but without `gmeta `:

```shell
$ docker run -v [PATH]:/data/ --rm -it [IMAGE] info [FILE]
$ docker run -v [PATH]:/data/ --rm -it [IMAGE] count [FILE]
$ docker run -v [PATH]:/data/ --rm -it [IMAGE] list [FILE]
$ docker run -v [PATH]:/data/ --rm -it [IMAGE] find [FILE]
```

**examples from [TEST.md](TEST.md):**

```shell
$ gmeta list var ABoVE_240mgrid_tiles.shp                 \\  field names
$ gmeta list var FLUXNET_Canada_Site_Information.csv      \\  column names
$ gmeta list var daymet_v3_tmin_monavg_2017_hi.nc         \\  variable names
$ gmeta list dim daymet_v3_tmin_monavg_2017_hi.nc         \\  dimension names
$ gmeta list att daymet_v3_tmin_monavg_2017_hi.nc         \\  attribute names
$ gmeta list grp daymet_v3_tmin_monavg_2017_hi.nc         \\  group names

$ gmeta count FLUXNET_Canada_Site_Information.csv         \\  row count
$ gmeta count ABoVE_240mgrid_tiles.shp                    \\  feature count
$ gmeta count Snowmelt_Timing_NA_2001.tif                 \\  band count
$ gmeta count ABoVE_240mgrid_tiles.shp                    \\  feature count
$ gmeta count daymet_v3_tmin_monavg_2017_hi.nc            \\  record dim size

$ gmeta count var daymet_v3_tmin_monavg_2017_hi.nc        \\  variable count
$ gmeta count dim daymet_v3_tmin_monavg_2017_hi.nc        \\  dimension count
$ gmeta count grp daymet_v3_tmin_monavg_2017_hi.nc        \\  group count

$ gmeta find var=lat FLUXNET_Canada_Site_Information.csv  \\  column name(s)
$ gmeta find var=lon grp daymet_v3_tmin_monavg_2017_hi.nc \\  variable name(s)
```