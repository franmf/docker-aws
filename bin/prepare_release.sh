#!/bin/sh -x
#	./bin/prepare_release.sh <version> <old_version>
################################################################################
##	Copyright (C) 2020	  Alejandro Colomar Andrés		      ##
##	Copyright (C) 2020	  Sebastian Francisco Colomar Bauza	      ##
##	SPDX-License-Identifier:  GPL-2.0-only				      ##
################################################################################
##
## Prepare the repo for release
## ============================
##
##  - Remove the files that shouldn't go into the release
##  - Update version numbers
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh


################################################################################
##	definitions							      ##
################################################################################
ARGC=2


################################################################################
##	functions							      ##
################################################################################
update_version()
{
	local	version=$1
	local	old_version=$2

	sed "/branch_app=/s/$old_version/$version/"			\
			-i ./README-app.md				\
			-i ./README-aws.md				\
			-i ./README-cluster.md				\
			-i ./README.md

	sed "/branch_docker_aws=/s/$old_version/$version/"		\
			-i ./README-app.md				\
			-i ./README-aws.md				\
			-i ./README-cluster.md				\
			-i ./README.md
}


################################################################################
##	main								      ##
################################################################################
main()
{
	local	version=$1
	local	oldversion=$2

	update_version	${version} $oldversion
}


################################################################################
##	run								      ##
################################################################################
argc="$#"
if [ "${argc}" -ne ${ARGC} ]; then
	echo	"Illegal number of parameters (Requires ${ARGC})"
	exit	${EX_USAGE}
fi

main	"$1" "$2"


################################################################################
##	end of file							      ##
################################################################################
