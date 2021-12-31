#!/bin/bash
#
# List deployment keys grouped by title

. "$(dirname -- "$0")/.hub"

keys_url:user

declare -A KT KU KV KC KR KK
KI=()
j:showkey()
{
  case "$1" in
  ('')			return;;
  (_*_id)		ID="$2"; KI+=("$2"); return;;
  (_*_title)		KT["$ID"]="$2"; return;;
  (_*_url)		KU["$ID"]="$2"; return;;
  (_*_verified)		KV["$ID"]="$2"; return;;
  (_*_created__at)	KC["$ID"]="$2"; return;;
  (_*_read__only)	KR["$ID"]="$2"; return;;
  (_*_key)		KK["$ID"]="$2"; return;;
  esac
  BUG["$1"]=1
}

GOT=()
for a in "${!KEYS[@]}"
do
	b="${a%%'{'*}"	# remove {/key_id}
	hub "$b"	# fetch all keys
	json showkey
done

declare -A ORD
# Now everything is fetched
for a in "${KI[@]}" 
do
	T="${KT["$a"]}"
	U="${KU["$a"]}"
	U="${U#"${API}repos/"}"
	U="${U#"${API}repos/"}"
	U="${U%"/keys/$a"}"
	ORD["$T"]="${ORD["$T"]} $U"
done

for a in "${!ORD[@]}" 
do
	printf '%q\t%s\n' "$a" "${ORD["$a"]}"
done

