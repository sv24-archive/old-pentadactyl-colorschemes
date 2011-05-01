#!/bin/bash

# Synchronize files in repository with files in pentadactyl directory.

PENTADIR="$HOME/.pentadactyl"
COLORSDIR="$PENTADIR/colors"

OIFS=$IFS
IFS=","
COLORS=("simple.penta,simple_dark.penta")

Usage(){
	echo "Usage: $(basename $0) OPTION
Options:
	-n [--no-op] 
		Echo actions to be performed. Do not perform them.
	-v [--verbose]
		Echo actions and perform them.
	-s [--silent] (Default action, when no flags provided)
		Only perform actions, do not echo them.
	-h [--help] 
		Print this message."
}

update_colors(){
	case $1 in
		"noop" )
			for color in ${COLORS[@]} ; do
				echo "cp $color $COLORSDIR"
			done
			;;
		"verbose" )
			for color in ${COLORS[@]} ; do
				cp $color $COLORSDIR
				echo "cp $color $COLORSDIR ... DONE"
			done
			;;
		"silent" )
			for color in ${COLORS[@]} ; do
				cp $color $COLORSDIR
			done
			;;
	esac
}

case $1 in
	"-n" | "--no-op" )
		update_colors noop
		;;
	"-v" | "--verbose" )
		update_colors verbose
		;;
	"-h" | "--help" )
		Usage
		;;
	"-s" | "--silent" | * )
		update_colors silent
		;;
esac

IFS=$OIFS
# vim:noet
