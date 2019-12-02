
# gmeta/test.sh


## BUILD IMAGE: gmeta-local

```
Sending build context to Docker daemon  64.28MB
Step 1/14 : FROM osgeo/gdal:ubuntu-full-latest
 ---> 4d01b5cea335
Step 2/14 : ENV LC_ALL=C.UTF-8
 ---> Using cache
 ---> c72bc32bd8cb
Step 3/14 : ENV LANG=C.UTF-8
 ---> Using cache
 ---> a04a91b39c70
Step 4/14 : RUN apt-get update && apt-get install -y     apt-utils     software-properties-common     python3-pip     python-pip     nco     --reinstall coreutils
 ---> Using cache
 ---> 4b76b15a1919
Step 5/14 : RUN add-apt-repository ppa:ubuntugis/ppa
 ---> Using cache
 ---> c5bf8ee7e301
Step 6/14 : RUN pip3 install rasterio fiona
 ---> Using cache
 ---> 61e6d061623a
Step 7/14 : COPY ./xsv /opt/xsv
 ---> Using cache
 ---> 4d20f8e8c4b8
Step 8/14 : RUN ln -s /opt/xsv /usr/bin/xsv
 ---> Using cache
 ---> 4af14bc484c3
Step 9/14 : COPY ./gmeta /opt/gmeta
 ---> 491d85b6b609
Step 10/14 : RUN chmod +x /opt/gmeta
 ---> Running in 182a61b2bfce
Removing intermediate container 182a61b2bfce
 ---> cf44a8267c40
Step 11/14 : RUN ln -s /opt/gmeta /usr/bin/gmeta
 ---> Running in a1fe598aa92b
Removing intermediate container a1fe598aa92b
 ---> b5267c729535
Step 12/14 : VOLUME ["/data"]
 ---> Running in e7894e4f8d75
Removing intermediate container e7894e4f8d75
 ---> 4dda74636f22
Step 13/14 : WORKDIR /data
 ---> Running in ca0369378e46
Removing intermediate container ca0369378e46
 ---> 67cad83a3a8f
Step 14/14 : ENTRYPOINT ["gmeta"]
 ---> Running in 4f97dc678392
Removing intermediate container 4f97dc678392
 ---> f6cb936ff0d8
Successfully built f6cb936ff0d8
Successfully tagged gmeta-local:latest
```

## **RUN LOCAL:** gmeta-local

### INFO: gmeta info

#### gmeta info \[MULTIDIM:daymet_v3_tmin_monavg_2017_hi.nc\]

```
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

{
  "cmd": "gdalmdiminfo daymet_v3_tmin_monavg_2017_hi.nc -nopretty ",
  "js": true
}

```

#### gmeta info \[RASTER:Snowmelt_Timing_North_America_2001.tif\]

```
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
    "wkt": "PROJCRS[\"Unknown_datum_based_upon_the_custom_spheroid_Sinusoidal\",\n BASEGEOGCRS[\"GCS_Unknown_datum_based_upon_the_custom_spheroid\",\n DATUM[\"Not_specified_based_on_custom_spheroid\",\n ELLIPSOID[\"Custom_spheroid\",6371007.181,0,\n LENGTHUNIT[\"metre\",1,\n ID[\"EPSG\",9001]]]],\n PRIMEM[\"Greenwich\",0,\n ANGLEUNIT[\"degree\",0.0174532925199433,\n ID[\"EPSG\",9122]]]],\n CONVERSION[\"unnamed\",\n METHOD[\"Sinusoidal\"],\n PARAMETER[\"Longitude of natural origin\",0,\n ANGLEUNIT[\"degree\",0.0174532925199433],\n ID[\"EPSG\",8802]],\n PARAMETER[\"False easting\",0,\n LENGTHUNIT[\"metre\",1],\n ID[\"EPSG\",8806]],\n PARAMETER[\"False northing\",0,\n LENGTHUNIT[\"metre\",1],\n ID[\"EPSG\",8807]]],\n CS[Cartesian,2],\n AXIS[\"easting\",east,\n ORDER[1],\n LENGTHUNIT[\"metre\",1,\n ID[\"EPSG\",9001]]],\n AXIS[\"northing\",north,\n ORDER[2],\n LENGTHUNIT[\"metre\",1,\n ID[\"EPSG\",9001]]]]",
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

{
  "cmd": "gdalinfo -proj4 -json Snowmelt_Timing_North_America_2001.tif ",
  "dcode": true,
  "strp": true,
  "js": true
}

```

#### gmeta info \[TABLE:FLUXNET_Canada_Site_Information.csv\]

```
field,type,sum,min,max,min_length,max_length,mean,stddev
file_name,Unicode,,0-Fluxnet-Canada.zip,SK-OldJackPine.zip,10,29,,
num_files,Integer,21494,18,1629,2,4,651.3333333333334,553.4272647545813
siteid,Integer,28846,118,9999,3,4,874.1212121212121,1871.8790066696756
fluxnetid,Unicode,,CA-Ca1,n/a,3,6,,
sitename,Unicode,,AB-Lethbridge Grassland,n/a,3,48,,
site_desc,Unicode,,Alberta - Mixed Grass Prairie.,Saskatchewan - Western Boreal; wetland.,23,91,,
lat,Float,1500.38613,-99.9999,55.88,5,8,45.466246363636365,26.0813225305522
lon,Float,-13056.25786,-9999.99,-67.09933,7,10,-395.6441775757576,1697.9127066650933
start_year,Integer,66000,1993,2012,4,4,2000,4.664501662297419
end_year,Integer,66315,2005,2014,4,4,2009.5454545454545,2.583055614681971
pi,Unicode,, Alan Barr,n/a,3,53,,
 pi_email,Unicode,,Brian_Amiro@umanitoba.ca,s.murayama@aist.go.jp; alan.barr@ec.gc.ca,3,65,,


{
  "cmd": "xsv stats FLUXNET_Canada_Site_Information.csv ",
  "dcode": true
}

```

#### gmeta info \[VECTOR:ABoVE_240mgrid_tiles.shp\]

```
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

{
  "cmd": "fio info ABoVE_240mgrid_tiles.shp ",
  "js": true
}

```

#### gmeta info lyr=\[NUMBER:0\] \[VECTOR:ABoVE_240mgrid_tiles.shp\]

```
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

{
  "cmd": "fio info --layer=0 ABoVE_240mgrid_tiles.shp ",
  "js": true
}

```

### FIND: gmeta find

#### gmeta find var=\[KEYWORD:name\] \[TABLE:FLUXNET_Canada_Site_Information.csv\]

```
file_name sitename

{
  "cmd": "xsv headers FLUXNET_Canada_Site_Information.csv -j | grep -o '.*name.*'",
  "dcode": true,
  "strp": true
}

```

#### gmeta find var=\[KEYWORD:lon\] \[MULTID:daymet_v3_tmin_monavg_2017_hi.nc\]

```
lon

{
  "cmd": "ncks --trd -m daymet_v3_tmin_monavg_2017_hi.nc | grep -e ': type' | cut -f 1 -d ' ' | sed 's/://' | sort | grep -o '.*lon.*'",
  "dcode": true,
  "strp": true
}

```

#### gmeta find var=\[KEYWORD:lat\] \[MULTID:daymet_v3_tmin_monavg_2017_hi.nc\]

```
lat

{
  "cmd": "ncks --trd -m daymet_v3_tmin_monavg_2017_hi.nc | grep -e ': type' | cut -f 1 -d ' ' | sed 's/://' | sort | grep -o '.*lat.*'",
  "dcode": true,
  "strp": true
}

```

#### gmeta find var=\[KEYWORD:time\] \[MULTID:daymet_v3_tmin_monavg_2017_hi.nc\]

```
time time_bnds

{
  "cmd": "ncks --trd -m daymet_v3_tmin_monavg_2017_hi.nc | grep -e ': type' | cut -f 1 -d ' ' | sed 's/://' | sort | grep -o '.*time.*'",
  "dcode": true,
  "strp": true
}

```

### LIST: gmeta list

#### gmeta list vars \[TABLE:FLUXNET_Canada_Site_Information.csv\]

```
file_name num_files siteid fluxnetid sitename site_desc lat lon start_year end_year pi pi_email

{
  "cmd": "xsv headers FLUXNET_Canada_Site_Information.csv -j ",
  "dcode": true,
  "strp": true
}

```

#### gmeta list vars \[MULTID:daymet_v3_tmin_monavg_2017_hi.nc\]

```
lambert_conformal_conic lat lon time time_bnds tmin x y

{
  "cmd": "ncks --trd -m daymet_v3_tmin_monavg_2017_hi.nc | grep -e ': type' | cut -f 1 -d ' ' | sed 's/://' | sort ",
  "dcode": true,
  "strp": true
}

```

#### gmeta list grps \[MULTID:daymet_v3_tmin_monavg_2017_hi.nc\]

```


{
  "cmd": "ncks -m daymet_v3_tmin_monavg_2017_hi.nc | grep 'group:' | cut -d ':' -f 2 | cut -d ' ' -f 2 | sort ",
  "dcode": true,
  "strp": true
}

```

#### gmeta list dims \[MULTID:daymet_v3_tmin_monavg_2017_hi.nc\]

```
nv time x y

{
  "cmd": "ncks --cdl -m daymet_v3_tmin_monavg_2017_hi.nc | cut -d ':' -f 1 | cut -d '=' -s -f 1 ",
  "dcode": true,
  "strp": true
}

```

