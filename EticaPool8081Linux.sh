#!/usr/bin/env bash

command -v dotnet >/dev/null 2>&1 ||
{
 echo >&2 ".NET Core is not found or not installed,"
 echo >&2 "run 'sh install-deps.sh' to install dependencies.";
 read -p "Press any key to continue...";
 exit 1;
}
while : ; do
  if [ -f SoliditySHA3Miner.conf ] ; then
    rm -f SoliditySHA3Miner.conf
  fi
  dotnet SoliditySHA3Miner.dll allowCPU=false allowIntel=true allowAMD=true allowCUDA=true abiFile=0xBTC.abi contract=0x34c61EA91bAcdA647269d4e310A86b875c09946f overrideMaxTarget=26959946667150639794667015087019630673637144422540572481103610249216 pool=http://eticapool.com:8081 address=0x806E4dB4DA2449A589F50F893d75c3CEAa824A17
  [[ $? -eq 22 ]] || break
done
