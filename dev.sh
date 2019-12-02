# -----------------------------------------------------------------------------
## NCO
# -----------------------------------------------------------------------------

# ncattget : What attributes does variable have?
#  $att_nm 
#  $var_nm 
#  $fl_nm : 

function ncattget { ncks --trd -M -m ${3} | grep -E -i "^${2} attribute [0-9]+: ${1}" | cut -f 11- -d ' ' | sort ; }


# ncunits : Which variables have given units?
#  $att_val
#  $fl_nm

function ncunits { ncks --trd -m ${2} | grep -E -i " attribute [0-9]+: units.+ ${1}" | cut -f 1 -d ' ' | sort ; }


# ncavg : What is mean of variable?
#  $var_nm 
#  $fl_nm

function ncavg { ncwa -y avg -O -C -v ${1} ${2} ~/foo.nc ; ncks --trd -H -C -v ${1} ~/foo.nc | cut -f 3- -d ' ' ; }


# ncavg : What is mean of variable?
#  $var_nm 
#  $fl_nm

function ncavg { ncap2 -O -C -v -s "foo=${1}.avg();print(foo)" ${2} ~/foo.nc | cut -f 3- -d ' ' ; }


# ncdmnlst : What dimensions are in file?
#  $fl_nm

function ncdmnlst { ncks --cdl -m ${1} | cut -d ':' -f 1 | cut -d '=' -s -f 1 ; }


# ncdmnsz : What is dimension size?
#  $dmn_nm 
#  $fl_nm

function ncdmnsz { ncks --trd -m -M ${2} | grep -E -i ": ${1}, size =" | cut -f 7 -d ' ' | uniq ; }


# ncgrplst : What groups are in file?
#  $fl_nm

function ncgrplst { ncks -m ${1} | grep 'group:' | cut -d ':' -f 2 | cut -d ' ' -f 2 | sort ; }


# ncvarlst : What variables are in file?
#  $fl_nm

function ncvarlst { ncks --trd -m ${1} | grep -E ': type' | cut -f 1 -d ' ' | sed 's/://' | sort ; }


# ncmax: What is maximum of variable?
#  $var_nm 
#  $fl_nm

function ncmax { ncwa -y max -O -C -v ${1} ${2} ~/foo.nc ; ncks --trd -H -C -v ${1} ~/foo.nc | cut -f 3- -d ' ' ; }


# ncmax : What is maximum of variable?
#  $var_nm 
#  $fl_nm

function ncmax { ncap2 -O -C -v -s "foo=${1}.max();print(foo)" ${2} ~/foo.nc | cut -f 3- -d ' ' ; }


# ncmdn : What is median of variable?
#  $var_nm 
#  $fl_nm

function ncmdn { ncap2 -O -C -v -s "foo=gsl_stats_median_from_sorted_data(${1}.sort());print(foo)" ${2} ~/foo.nc | cut -f 3- -d ' ' ; }


# ncmin : What is minimum of variable?
#  $var_nm 
#  $fl_nm

function ncmin { ncap2 -O -C -v -s "foo=${1}.min();print(foo)" ${2} ~/foo.nc | cut -f 3- -d ' ' ; }


# ncrng : What is range of variable?
#  $var_nm 
#  $fl_nm

function ncrng { ncap2 -O -C -v -s "foo_min=${1}.min();foo_max=${1}.max();print(foo_min,\"%f\");print(\" to \");print(foo_max,\"%f\")" ${2} ~/foo.nc ; }


# ncmode : What is mode of variable?
#  $var_nm 
#  $fl_nm

function ncmode { ncap2 -O -C -v -s "foo=gsl_stats_median_from_sorted_data(${1}.sort());print(foo)" ${2} ~/foo.nc | cut -f 3- -d ' ' ; }


# ncrecsz : What is record dimension size?
#  $fl_nm 

function ncrecsz { ncks --trd -M ${1} | grep -E -i "^Record dimension:" | cut -f 8- -d ' ' ; }


# nctypget : What type is variable?
#  $var_nm 
#  $fl_nm

function nctypget { ncks --trd -m -v ${1} ${2} | grep -E -i "^${1}: type" | cut -f 3 -d ' ' | cut -f 1 -d ',' ; }


# -----------------------------------------------------------------------------
