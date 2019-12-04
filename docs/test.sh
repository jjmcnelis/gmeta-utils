#!/bin/bash

echo
echo "# *\`gmeta/test.sh\`*"
echo

# BUILD
context=/home/$USER/Documents/git/gmeta-utils/
interactive=${context}docs/interactive.dockerfile
local=${context}docs/local.dockerfile

# RUN
data=${context}tests/
test_tif=Snowmelt_Timing_North_America_2001.tif
test_shp=ABoVE_240mgrid_tiles.shp
test_nc4=daymet_v3_tmin_monavg_2017_hi.nc
test_csv=FLUXNET_Canada_Site_Information.csv



if [ "${1}" = "local" ]; then

  #############################################################################

  echo
  echo "## BUILD IMAGE: \`gmeta-local\`"
  echo
  echo "\`\`\`"
  docker build -t gmeta-local -f $local $context
  echo "\`\`\`"

  #############################################################################

  echo
  echo "## **RUN**"
  echo

  # ---------------------------------------------------------------------------

	echo "### INFO: \`gmeta info [FILE] \`"
  echo
  
  echo "#### \`gmeta info [MULTIDIM:${test_nc4}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_nc4
  echo "\`\`\`"
  echo
	
  echo "#### \`gmeta info [RASTER:${test_tif}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_tif
  echo "\`\`\`"
	echo
  
  echo "#### \`gmeta info [TABLE:${test_csv}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_csv
  echo "\`\`\`"
	echo
  
  echo "#### \`gmeta info [VECTOR:${test_shp}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local info $test_shp
  echo "\`\`\`"
	echo
  
  echo "#### \`gmeta info lyr=[NUMBER:0] [VECTOR:${test_shp}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local info lyr=0 $test_shp
  echo "\`\`\`"
  echo

  # ---------------------------------------------------------------------------

  echo "### LIST: \`gmeta list [CONSTRUCT (required): 'var', 'grp', 'dim'] [FILE] \`"
  echo
  
  echo "#### \`gmeta list var [TABLE:${test_csv}] \` (lists column names in table)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local list var $test_csv
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta list var [TABLE:${test_shp}] \` (lists fields in vector dataset)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local list var $test_shp
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta list var [MULTID:${test_nc4}] \` (lists variables names in multimensional dataset)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local list var $test_nc4
  echo "\`\`\`"
  echo

  echo "#### \`gmeta list dim [MULTID:${test_nc4}] \` (and dimension names)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local list dim $test_nc4
  echo "\`\`\`"
  echo

  echo "#### \`gmeta list att [MULTID:${test_nc4}] \` (and attribute names)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local list att $test_nc4
  echo "\`\`\`"
  echo

  echo "#### \`gmeta list grp [MULTID:${test_nc4}] \` (will also list group names)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local list grp $test_nc4
  echo "\`\`\`"
  echo

  # ---------------------------------------------------------------------------

  echo "### COUNT: \`gmeta count [CONSTRUCT (optional): 'var', 'dim'] [FILE] \`"
  echo
  
  echo "#### \`gmeta count [MULTID:${test_nc4}] \` (returns record count)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local count $test_nc4
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta count [TABLE:${test_csv}] \` (returns row count)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local count $test_csv
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta count [VECTOR:${test_shp}] \` (returns feature count)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local count $test_shp
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta count [RASTER:${test_tif}] \` (returns band count)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local count $test_tif
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta count dim [MULTID:${test_nc4}] \` (returns dimension count)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local count dim $test_nc4
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta count var [MULTID:${test_nc4}] \` (returns variable count)"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local count var $test_nc4
  echo "\`\`\`"
  echo

  # ---------------------------------------------------------------------------

  echo "### FIND: \`gmeta find var=[KEYWORD] [FILE] \`"
  echo
  
  echo "#### \`gmeta find var=[KEYWORD:lon] [TABLE:${test_csv}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local find var=lon $test_csv
  echo "\`\`\`"
	echo
  
  echo "#### \`gmeta find var=[KEYWORD:name] [TABLE:${test_csv}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local find var=name $test_csv
  echo "\`\`\`"
  echo 
  
  echo "#### \`gmeta find var=[KEYWORD:lat] [MULTID:${test_nc4}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local find var=lat $test_nc4
  echo "\`\`\`"
  echo
  
  echo "#### \`gmeta find var=[KEYWORD:time] [MULTID:${test_nc4}] \`"
  echo
  echo "\`\`\`json"
  docker run -v $data:/data/ --rm -it gmeta-local find var=time $test_nc4
  echo "\`\`\`"
  echo

  # ---------------------------------------------------------------------------

  # echo "### DATA: \`gmeta data var=[KEYWORD] [FILE] \`"
  # echo
  
  # echo "#### \`gmeta find var=[KEYWORD:tmin] [MULTID:${test_nc4}] \`"
  # echo
  # echo "\`\`\`json"
  # docker run -v $data:/data/ --rm -it gmeta-local data var=tmin $test_nc4
  # echo "\`\`\`"
	# echo

fi;



if [ "${1}" = "interactive" ]; then

  echo
  echo "## BUILD IMAGE: \`gmeta-interactive\`"
  echo
  docker build -t gmeta-interactive -f $interactive  $context
  
  echo
	echo "## RUN INTERACTIVE"
  echo
	docker run -v $data:/data/ --rm -it gmeta-interactive

fi;
