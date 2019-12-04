
# *`gmeta/test.sh`*


## BUILD IMAGE: `gmeta-local`

```
Sending build context to Docker daemon  99.71MB
Step 1/14 : FROM osgeo/gdal:ubuntu-full-latest
 ---> 9a2eac996105
Step 2/14 : ENV LC_ALL=C.UTF-8
 ---> Using cache
 ---> 915c62c05b19
Step 3/14 : ENV LANG=C.UTF-8
 ---> Using cache
 ---> e8d0bf28577a
Step 4/14 : RUN apt-get update && apt-get install -y     apt-utils     software-properties-common     python3-pip     python-pip     nco     --reinstall coreutils
 ---> Using cache
 ---> 8f00185a21ef
Step 5/14 : RUN add-apt-repository ppa:ubuntugis/ppa
 ---> Using cache
 ---> 5758d6a3c6d5
Step 6/14 : RUN pip3 install rasterio fiona pandas
 ---> Using cache
 ---> 078b9b28f182
Step 7/14 : COPY ./utils/xsv /opt/xsv
 ---> Using cache
 ---> 7080d226fcc8
Step 8/14 : RUN ln -s /opt/xsv /usr/bin/xsv
 ---> Using cache
 ---> 4788d686d24f
Step 9/14 : COPY ./gmeta /opt/gmeta
 ---> 410896695f30
Step 10/14 : RUN chmod +x /opt/gmeta
 ---> Running in 5f218a72f678
Removing intermediate container 5f218a72f678
 ---> 71077f8373d3
Step 11/14 : RUN ln -s /opt/gmeta /usr/bin/gmeta
 ---> Running in be7d8c9d4071
Removing intermediate container be7d8c9d4071
 ---> b7882dd59e4b
Step 12/14 : VOLUME ["/data"]
 ---> Running in 998e6e368f66
Removing intermediate container 998e6e368f66
 ---> bcc34da134a0
Step 13/14 : WORKDIR /data
 ---> Running in 6c3f059971cf
Removing intermediate container 6c3f059971cf
 ---> d8c3d3049e82
Step 14/14 : ENTRYPOINT ["gmeta"]
 ---> Running in 8822078311d3
Removing intermediate container 8822078311d3
 ---> 2ef9fb4a5f64
Successfully built 2ef9fb4a5f64
Successfully tagged gmeta-local:latest
```

## **RUN**

### INFO: `gmeta info [FILE] `

#### `gmeta info [MULTIDIM:daymet_v3_tmin_monavg_2017_hi.nc] `

```json

# INPUT: ---------> 

gdalmdiminfo daymet_v3_tmin_monavg_2017_hi.nc -nopretty 


# RESULT: ---------> 

{
  "type": "group",
  "driver": "netCDF",
  "name": "/",
  "attributes": {
    "start_year": 2017,
    "source": "Daymet Software Version 3.0",
    "Version_software": "Daymet Software Version 3.0",
    "Version_data": "Daymet Data Version 3.0",
    "Conventions": "CF-1.6",
    "citation": "Please see http://daymet.ornl.gov/ for current Daymet data citation information",
    "references": "Please see http://daymet.ornl.gov/ for current information on Daymet references",
    "NCO": "\"4.6.0\"",
    "nco_openmp_thread_number": 1
  },
  "dimensions": [
    {
      "name": "time",
      "full_name": "/time",
      "size": 12,
      "type": "TEMPORAL",
      "indexing_variable": "/time"
    },
    {
      "name": "nv",
      "full_name": "/nv",
      "size": 2
    },
    {
      "name": "y",
      "full_name": "/y",
      "size": 584,
      "type": "HORIZONTAL_Y",
      "indexing_variable": "/y"
    },
    {
      "name": "x",
      "full_name": "/x",
      "size": 284,
      "type": "HORIZONTAL_X",
      "indexing_variable": "/x"
    }
  ],
  "arrays": {
    "time_bnds": {
      "datatype": "Float32",
      "dimensions": [
        "/time",
        "/nv"
      ],
      "attributes": {
        "time": "days since 1980-01-01 00:00:00 UTC"
      },
      "structural_info": {
        "COMPRESS": "DEFLATE"
      }
    },
    "lat": {
      "datatype": "Float32",
      "dimensions": [
        "/y",
        "/x"
      ],
      "attributes": {
        "long_name": "latitude coordinate",
        "standard_name": "latitude"
      },
      "unit": "degrees_north",
      "structural_info": {
        "COMPRESS": "DEFLATE"
      }
    },
    "lon": {
      "datatype": "Float32",
      "dimensions": [
        "/y",
        "/x"
      ],
      "attributes": {
        "long_name": "longitude coordinate",
        "standard_name": "longitude"
      },
      "unit": "degrees_east",
      "structural_info": {
        "COMPRESS": "DEFLATE"
      }
    },
    "time": {
      "datatype": "Float32",
      "dimensions": [
        "/time"
      ],
      "attributes": {
        "long_name": "time",
        "calendar": "standard",
        "bounds": "time_bnds"
      },
      "unit": "days since 1980-01-01 00:00:00 UTC",
      "structural_info": {
        "COMPRESS": "DEFLATE"
      }
    },
    "tmin": {
      "datatype": "Float32",
      "dimensions": [
        "/time",
        "/y",
        "/x"
      ],
      "attributes": {
        "missing_value": -9999,
        "coordinates": "lat lon",
        "cell_methods": "area: mean time: minimum within days time: mean over days",
        "long_name": "monthly average of daily minimum temperature"
      },
      "unit": "degrees C",
      "nodata_value": -9999,
      "srs": {
        "wkt": "PROJCRS[\"unnamed\",BASEGEOGCRS[\"unknown\",DATUM[\"unnamed\",ELLIPSOID[\"Spheroid\",6378137,298.25723,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]]],PRIMEM[\"Greenwich\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9122]]]],CONVERSION[\"unnamed\",METHOD[\"Lambert Conic Conformal (2SP)\",ID[\"EPSG\",9802]],PARAMETER[\"Latitude of false origin\",42.5,ANGLEUNIT[\"degree\",0.0174532925199433],ID[\"EPSG\",8821]],PARAMETER[\"Longitude of false origin\",-100,ANGLEUNIT[\"degree\",0.0174532925199433],ID[\"EPSG\",8822]],PARAMETER[\"Latitude of 1st standard parallel\",25,ANGLEUNIT[\"degree\",0.0174532925199433],ID[\"EPSG\",8823]],PARAMETER[\"Latitude of 2nd standard parallel\",60,ANGLEUNIT[\"degree\",0.0174532925199433],ID[\"EPSG\",8824]],PARAMETER[\"Easting at false origin\",0,LENGTHUNIT[\"metre\",1],ID[\"EPSG\",8826]],PARAMETER[\"Northing at false origin\",0,LENGTHUNIT[\"metre\",1],ID[\"EPSG\",8827]]],CS[Cartesian,2],AXIS[\"easting\",east,ORDER[1],LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],AXIS[\"northing\",north,ORDER[2],LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]]]",
        "data_axis_to_srs_axis_mapping": [
          3,
          2
        ]
      },
      "structural_info": {
        "COMPRESS": "DEFLATE"
      }
    },
    "x": {
      "datatype": "Float32",
      "dimensions": [
        "/x"
      ],
      "attributes": {
        "long_name": "x coordinate of projection",
        "standard_name": "projection_x_coordinate"
      },
      "unit": "m",
      "structural_info": {
        "COMPRESS": "DEFLATE"
      }
    },
    "y": {
      "datatype": "Float32",
      "dimensions": [
        "/y"
      ],
      "attributes": {
        "long_name": "y coordinate of projection",
        "standard_name": "projection_y_coordinate"
      },
      "unit": "m",
      "structural_info": {
        "COMPRESS": "DEFLATE"
      }
    }
  },
  "structural_info": {
    "NC_FORMAT": "NETCDF4_CLASSIC"
  }
}

```

#### `gmeta info [RASTER:Snowmelt_Timing_North_America_2001.tif] `

```json

# INPUT: ---------> 

gdalinfo -proj4 -json Snowmelt_Timing_North_America_2001.tif 


# RESULT: ---------> 

{
  "description": "Snowmelt_Timing_North_America_2001.tif",
  "driverShortName": "GTiff",
  "driverLongName": "GeoTIFF",
  "files": [
    "Snowmelt_Timing_North_America_2001.tif"
  ],
  "size": [
    28800,
    19200
  ],
  "coordinateSystem": {
    "wkt": "PROJCRS[\"Unknown_datum_based_upon_the_custom_spheroid_Sinusoidal\",\n    BASEGEOGCRS[\"GCS_Unknown_datum_based_upon_the_custom_spheroid\",\n        DATUM[\"Not_specified_based_on_custom_spheroid\",\n            ELLIPSOID[\"Custom_spheroid\",6371007.181,0,\n                LENGTHUNIT[\"metre\",1,\n                    ID[\"EPSG\",9001]]]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433,\n                ID[\"EPSG\",9122]]]],\n    CONVERSION[\"unnamed\",\n        METHOD[\"Sinusoidal\"],\n        PARAMETER[\"Longitude of natural origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8802]],\n        PARAMETER[\"False easting\",0,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8806]],\n        PARAMETER[\"False northing\",0,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8807]]],\n    CS[Cartesian,2],\n        AXIS[\"easting\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1,\n                ID[\"EPSG\",9001]]],\n        AXIS[\"northing\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1,\n                ID[\"EPSG\",9001]]]]",
    "dataAxisToSRSAxisMapping": [
      1,
      2
    ],
    "proj4": "+proj=sinu +lon_0=0 +x_0=0 +y_0=0 +R=6371007.181 +units=m +no_defs"
  },
  "geoTransform": [
    -13343406.236,
    463.31271652749973,
    0.0,
    10007554.676997999,
    0.0,
    -463.31271652749973
  ],
  "metadata": {
    "": {
      "AREA_OR_POINT": "Area"
    },
    "IMAGE_STRUCTURE": {
      "COMPRESSION": "LZW",
      "INTERLEAVE": "BAND"
    }
  },
  "cornerCoordinates": {
    "upperLeft": [
      -13343406.236,
      10007554.677
    ],
    "lowerLeft": [
      -13343406.236,
      1111950.52
    ],
    "lowerRight": [
      -0.0,
      1111950.52
    ],
    "upperRight": [
      -0.0,
      10007554.677
    ],
    "center": [
      -6671703.118,
      5559752.598
    ]
  },
  "wgs84Extent": {
    "type": "Polygon",
    "coordinates": [
      [
        [
          -123.1935899,
          90.0
        ],
        [
          -121.8511934,
          10.0
        ],
        [
          -0.0,
          10.0
        ],
        [
          -0.5093725,
          90.0
        ],
        [
          -123.1935899,
          90.0
        ]
      ]
    ]
  },
  "bands": [
    {
      "band": 1,
      "block": [
        128,
        128
      ],
      "type": "Byte",
      "colorInterpretation": "Gray",
      "noDataValue": 255.0,
      "overviews": [
        {
          "size": [
            14400,
            9600
          ]
        },
        {
          "size": [
            7200,
            4800
          ]
        },
        {
          "size": [
            3600,
            2400
          ]
        },
        {
          "size": [
            1800,
            1200
          ]
        },
        {
          "size": [
            900,
            600
          ]
        },
        {
          "size": [
            600,
            400
          ]
        }
      ],
      "metadata": {}
    }
  ]
}

```

#### `gmeta info [TABLE:FLUXNET_Canada_Site_Information.csv] `

```json

# INPUT: ---------> 

xsv stats FLUXNET_Canada_Site_Information.csv | python3 -c "import sys, json, pandas; print(pandas.read_csv(sys.stdin).to_json(orient='records'))" 


# RESULT: ---------> 

[
  {
    "field": "file_name",
    "type": "Unicode",
    "sum": null,
    "min": "0-Fluxnet-Canada.zip",
    "max": "SK-OldJackPine.zip",
    "min_length": 10,
    "max_length": 29,
    "mean": null,
    "stddev": null
  },
  {
    "field": "num_files",
    "type": "Integer",
    "sum": 21494.0,
    "min": "18",
    "max": "1629",
    "min_length": 2,
    "max_length": 4,
    "mean": 651.3333333333,
    "stddev": 553.4272647546
  },
  {
    "field": "siteid",
    "type": "Integer",
    "sum": 28846.0,
    "min": "118",
    "max": "9999",
    "min_length": 3,
    "max_length": 4,
    "mean": 874.1212121212,
    "stddev": 1871.8790066697
  },
  {
    "field": "fluxnetid",
    "type": "Unicode",
    "sum": null,
    "min": "CA-Ca1",
    "max": null,
    "min_length": 3,
    "max_length": 6,
    "mean": null,
    "stddev": null
  },
  {
    "field": "sitename",
    "type": "Unicode",
    "sum": null,
    "min": "AB-Lethbridge Grassland",
    "max": null,
    "min_length": 3,
    "max_length": 48,
    "mean": null,
    "stddev": null
  },
  {
    "field": "site_desc",
    "type": "Unicode",
    "sum": null,
    "min": "Alberta - Mixed Grass Prairie.",
    "max": "Saskatchewan - Western Boreal; wetland.",
    "min_length": 23,
    "max_length": 91,
    "mean": null,
    "stddev": null
  },
  {
    "field": "lat",
    "type": "Float",
    "sum": 1500.38613,
    "min": "-99.9999",
    "max": "55.88",
    "min_length": 5,
    "max_length": 8,
    "mean": 45.4662463636,
    "stddev": 26.0813225306
  },
  {
    "field": "lon",
    "type": "Float",
    "sum": -13056.25786,
    "min": "-9999.99",
    "max": "-67.09933",
    "min_length": 7,
    "max_length": 10,
    "mean": -395.6441775758,
    "stddev": 1697.9127066651
  },
  {
    "field": "start_year",
    "type": "Integer",
    "sum": 66000.0,
    "min": "1993",
    "max": "2012",
    "min_length": 4,
    "max_length": 4,
    "mean": 2000.0,
    "stddev": 4.6645016623
  },
  {
    "field": "end_year",
    "type": "Integer",
    "sum": 66315.0,
    "min": "2005",
    "max": "2014",
    "min_length": 4,
    "max_length": 4,
    "mean": 2009.5454545455,
    "stddev": 2.5830556147
  },
  {
    "field": "pi",
    "type": "Unicode",
    "sum": null,
    "min": " Alan Barr",
    "max": null,
    "min_length": 3,
    "max_length": 53,
    "mean": null,
    "stddev": null
  },
  {
    "field": " pi_email",
    "type": "Unicode",
    "sum": null,
    "min": "Brian_Amiro@umanitoba.ca",
    "max": "s.murayama@aist.go.jp; alan.barr@ec.gc.ca",
    "min_length": 3,
    "max_length": 65,
    "mean": null,
    "stddev": null
  }
]

```

#### `gmeta info [VECTOR:ABoVE_240mgrid_tiles.shp] `

```json

# INPUT: ---------> 

fio info ABoVE_240mgrid_tiles.shp 


# RESULT: ---------> 

{
  "driver": "ESRI Shapefile",
  "schema": {
    "properties": {
      "Id": "int:6",
      "UID": "int:15",
      "Ahh": "int:10",
      "Avv": "int:10",
      "Bh": "int:10",
      "Bv": "int:10"
    },
    "geometry": "Polygon"
  },
  "crs": "",
  "crs_wkt": "PROJCS[\"Canada_Albers_Equal_Area_Conic\",GEOGCS[\"GCS_North_American_1983\",DATUM[\"North_American_Datum_1983\",SPHEROID[\"GRS_1980\",6378137.0,298.257222101]],PRIMEM[\"Greenwich\",0.0],UNIT[\"Degree\",0.0174532925199433],AUTHORITY[\"EPSG\",\"4269\"]],PROJECTION[\"Albers_Conic_Equal_Area\"],PARAMETER[\"False_Easting\",0.0],PARAMETER[\"False_Northing\",0.0],PARAMETER[\"longitude_of_center\",-96.0],PARAMETER[\"Standard_Parallel_1\",50.0],PARAMETER[\"Standard_Parallel_2\",70.0],PARAMETER[\"latitude_of_center\",40.0],UNIT[\"Meter\",1.0],AUTHORITY[\"Esri\",\"102001\"]]",
  "bounds": [
    -3400020.0,
    320000.0001220703,
    3079980.0001220703,
    4640000.00012207
  ],
  "name": "ABoVE_240mgrid_tiles",
  "count": 24
}

```

#### `gmeta info lyr=[NUMBER:0] [VECTOR:ABoVE_240mgrid_tiles.shp] `

```json

# INPUT: ---------> 

fio info --layer=0 ABoVE_240mgrid_tiles.shp 


# RESULT: ---------> 

{
  "driver": "ESRI Shapefile",
  "schema": {
    "properties": {
      "Id": "int:6",
      "UID": "int:15",
      "Ahh": "int:10",
      "Avv": "int:10",
      "Bh": "int:10",
      "Bv": "int:10"
    },
    "geometry": "Polygon"
  },
  "crs": "",
  "crs_wkt": "PROJCS[\"Canada_Albers_Equal_Area_Conic\",GEOGCS[\"GCS_North_American_1983\",DATUM[\"North_American_Datum_1983\",SPHEROID[\"GRS_1980\",6378137.0,298.257222101]],PRIMEM[\"Greenwich\",0.0],UNIT[\"Degree\",0.0174532925199433],AUTHORITY[\"EPSG\",\"4269\"]],PROJECTION[\"Albers_Conic_Equal_Area\"],PARAMETER[\"False_Easting\",0.0],PARAMETER[\"False_Northing\",0.0],PARAMETER[\"longitude_of_center\",-96.0],PARAMETER[\"Standard_Parallel_1\",50.0],PARAMETER[\"Standard_Parallel_2\",70.0],PARAMETER[\"latitude_of_center\",40.0],UNIT[\"Meter\",1.0],AUTHORITY[\"Esri\",\"102001\"]]",
  "bounds": [
    -3400020.0,
    320000.0001220703,
    3079980.0001220703,
    4640000.00012207
  ],
  "name": "ABoVE_240mgrid_tiles",
  "count": 24
}

```

### LIST: `gmeta list [CONSTRUCT (required): 'var', 'grp', 'dim'] [FILE] `

#### `gmeta list var [TABLE:FLUXNET_Canada_Site_Information.csv] ` (lists column names in table)

```json

# INPUT: ---------> 

xsv headers FLUXNET_Canada_Site_Information.csv -j 


# RESULT: ---------> 

file_name,num_files,siteid,fluxnetid,sitename,site_desc,lat,lon,start_year,end_year,pi,pi_email

```

#### `gmeta list var [TABLE:ABoVE_240mgrid_tiles.shp] ` (lists fields in vector dataset)

```json

# INPUT: ---------> 

fio info ABoVE_240mgrid_tiles.shp --indent 2 | python3 -c "import sys, json; print(','.join(list(json.load(sys.stdin)['schema']['properties'].keys())))" 


# RESULT: ---------> 

Id,UID,Ahh,Avv,Bh,Bv

```

#### `gmeta list var [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] ` (lists variables names in multimensional dataset)

```json

# INPUT: ---------> 

ncks --jsn -M daymet_v3_tmin_monavg_2017_hi.nc | python3 -c "import sys, json; print(','.join(list(json.load(sys.stdin)['variables'].keys()))) " 


# RESULT: ---------> 

lambert_conformal_conic,lat,lon,time,time_bnds,tmin,x,y

```

#### `gmeta list dim [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] ` (and dimension names)

```json

# INPUT: ---------> 

ncks --jsn -M daymet_v3_tmin_monavg_2017_hi.nc | python3 -c "import sys, json; print(','.join(list(json.load(sys.stdin)['dimensions'].keys()))) " 


# RESULT: ---------> 

time,nv,y,x

```

#### `gmeta list att [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] ` (and attribute names)

```json

# INPUT: ---------> 

ncks --jsn -M daymet_v3_tmin_monavg_2017_hi.nc | python3 -c "import sys, json; print(','.join(list(json.load(sys.stdin)['attributes'].keys()))) " 


# RESULT: ---------> 

start_year,source,Version_software,Version_data,Conventions,citation,references,NCO,nco_openmp_thread_number

```

#### `gmeta list grp [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] ` (will also list group names)

```json

# INPUT: ---------> 

ncks -m daymet_v3_tmin_monavg_2017_hi.nc | grep 'group:' | cut -d ':' -f 2 | cut -d ' ' -f 2 | sort 


# RESULT: ---------> 



```

### COUNT: `gmeta count [CONSTRUCT (optional): 'var', 'dim'] [FILE] `

#### `gmeta count [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] ` (returns record count)

```json

# INPUT: ---------> 

ncks --trd -M daymet_v3_tmin_monavg_2017_hi.nc | grep -E -i "Root record dimension 0:" | cut -f 8- -d ' ' | cut -f 2- -d '=' 


# RESULT: ---------> 

12

```

#### `gmeta count [TABLE:FLUXNET_Canada_Site_Information.csv] ` (returns row count)

```json

# INPUT: ---------> 

xsv count FLUXNET_Canada_Site_Information.csv 


# RESULT: ---------> 

33


```

#### `gmeta count [VECTOR:ABoVE_240mgrid_tiles.shp] ` (returns feature count)

```json

# INPUT: ---------> 

fio info --count ABoVE_240mgrid_tiles.shp 


# RESULT: ---------> 

24

```

#### `gmeta count [RASTER:Snowmelt_Timing_North_America_2001.tif] ` (returns band count)

```json

# INPUT: ---------> 

gdalinfo -proj4 -json Snowmelt_Timing_North_America_2001.tif | python3 -c "import sys, json; print(len(json.load(sys.stdin)['bands']))" 


# RESULT: ---------> 

1


```

#### `gmeta count dim [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] ` (returns dimension count)

```json

# INPUT: ---------> 

ncks --jsn -M daymet_v3_tmin_monavg_2017_hi.nc | python3 -c "import sys, json; print(len(json.load(sys.stdin)['dimensions'])) " 


# RESULT: ---------> 

4

```

#### `gmeta count var [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] ` (returns variable count)

```json

# INPUT: ---------> 

ncks --jsn -M daymet_v3_tmin_monavg_2017_hi.nc | python3 -c "import sys, json; print(len(json.load(sys.stdin)['variables'])) " 


# RESULT: ---------> 

8

```

### FIND: `gmeta find var=[KEYWORD] [FILE] `

#### `gmeta find var=[KEYWORD:lon] [TABLE:FLUXNET_Canada_Site_Information.csv] `

```json

# INPUT: ---------> 

xsv headers FLUXNET_Canada_Site_Information.csv -j | grep -o '.*lon.*' 


# RESULT: ---------> 

lon

```

#### `gmeta find var=[KEYWORD:name] [TABLE:FLUXNET_Canada_Site_Information.csv] `

```json

# INPUT: ---------> 

xsv headers FLUXNET_Canada_Site_Information.csv -j | grep -o '.*name.*' 


# RESULT: ---------> 

file_name,sitename

```

#### `gmeta find var=[KEYWORD:lat] [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] `

```json

# INPUT: ---------> 

ncks --trd -m daymet_v3_tmin_monavg_2017_hi.nc | grep -e ': type' | cut -f 1 -d ' ' | sed 's/://' | sort | grep -o '.*lat.*' 


# RESULT: ---------> 

lat

```

#### `gmeta find var=[KEYWORD:time] [MULTID:daymet_v3_tmin_monavg_2017_hi.nc] `

```json

# INPUT: ---------> 

ncks --trd -m daymet_v3_tmin_monavg_2017_hi.nc | grep -e ': type' | cut -f 1 -d ' ' | sed 's/://' | sort | grep -o '.*time.*' 


# RESULT: ---------> 

time,time_bnds

```

