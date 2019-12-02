#!/bin/bash

echo
echo "# gmeta/test.sh"
echo

# BUILD
context=/home/jack/Documents/git/gmeta-utils/
interactive=${context}docs/interactive.dockerfile
local=${context}docs/local.dockerfile

# RUN
data=${context}tests/

# TEST FILES
test_tif=Snowmelt_Timing_North_America_2001.tif
test_shp=ABoVE_240mgrid_tiles.shp
test_nc4=daymet_v3_tmin_monavg_2017_hi.nc
test_csv=FLUXNET_Canada_Site_Information.csv


if [ "${1}" = "local" ]; then
  echo
  echo "## BUILD IMAGE: gmeta-local"
  echo
  echo "\`\`\`"
  docker build -t gmeta-local -f $local $context
  echo "\`\`\`"
  echo
  echo "## **RUN LOCAL:** gmeta-local"
  echo
	echo "### INFO: gmeta info"
  echo
  echo "#### gmeta info \[MULTIDIM:${test_nc4}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_nc4
  echo "\`\`\`"
  echo
	echo "#### gmeta info \[RASTER:${test_tif}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_tif
  echo "\`\`\`"
	echo
  echo "#### gmeta info \[TABLE:${test_csv}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_csv
  echo "\`\`\`"
	echo
  echo "#### gmeta info \[VECTOR:${test_shp}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_shp
  echo "\`\`\`"
	echo
  echo "#### gmeta info lyr=\[NUMBER:0\] \[VECTOR:${test_shp}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local info lyr=0 $test_shp
  echo "\`\`\`"
  echo
  echo "### FIND: gmeta find"
  echo
  echo "#### gmeta find var=\[KEYWORD:name\] \[TABLE:${test_csv}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local find var=name $test_csv
  echo "\`\`\`"
	echo
  echo "#### gmeta find var=\[KEYWORD:lon\] \[MULTID:${test_nc4}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local find var=lon $test_nc4
  echo "\`\`\`"
  echo 
  echo "#### gmeta find var=\[KEYWORD:lat\] \[MULTID:${test_nc4}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local find var=lat $test_nc4
  echo "\`\`\`"
  echo
  echo "#### gmeta find var=\[KEYWORD:time\] \[MULTID:${test_nc4}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local find var=time $test_nc4
  echo "\`\`\`"
  echo
  echo "### LIST: gmeta list"
  echo
  echo "#### gmeta list vars \[TABLE:${test_csv}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local list vars $test_csv
  echo "\`\`\`"
  echo
  echo "#### gmeta list vars \[MULTID:${test_nc4}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local list vars $test_nc4
  echo "\`\`\`"
  echo
  echo "#### gmeta list grps \[MULTID:${test_nc4}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local list grps $test_nc4
  echo "\`\`\`"
  echo
  echo "#### gmeta list dims \[MULTID:${test_nc4}\]"
  echo
  echo "\`\`\`"
  docker run -v $data:/data/ --rm -it gmeta-local list dims $test_nc4
  echo "\`\`\`"
  echo
fi;


if [ "${1}" = "interactive" ]; then
  echo
  echo "## BUILD IMAGE: gmeta-interactive"
  echo
  docker build -t gmeta-interactive -f $interactive  $context
  echo
	echo "## RUN INTERACTIVE"
  echo
	docker run -v $data:/data/ --rm -it gmeta-interactive
fi;