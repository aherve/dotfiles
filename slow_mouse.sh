#!/bin/sh

ids=$(xinput --list | awk -v search="Logitech Gaming Mouse G300" \
  '$0 ~ search {match($0, /id=[0-9]+/);\
  if (RSTART) \
    print substr($0, RSTART+3, RLENGTH-3)\
  }'\
  )

for i in $ids
do
  xinput set-prop $i 289 -1
  #xinput set-prop $i 'Evdev Scrolling Distance' -1 -1 -1
done

#ids=$(xinput --list | awk -v search="Logitech Gaming Mouse" \
  #'$0 ~ search {match($0, /id=[0-9]+/);\
  #if (RSTART) \
    #print substr($0, RSTART+3, RLENGTH-3)\
  #}'\
  #)

#for i in $ids
#do
  #echo $i
  #xinput set-prop $i 'Device Accel Constant Deceleration' 2
  ##xinput set-prop $i 'Evdev Scrolling Distance' -1 -1 -1
#done

## to deactivate trackpad : xinput set-prop 11 '133' 0 (11 is device id, 133 is 'Device enabled')

#ids=$(xinput --list | awk -v search="USB Optical Mouse" \
  #'$0 ~ search {match($0, /id=[0-9]+/);\
  #if (RSTART) \
    #print substr($0, RSTART+3, RLENGTH-3)\
  #}'\
  #)

#for i in $ids
#do
  #echo $i
  #xinput set-prop $i 'Device Accel Constant Deceleration' 2
  ##xinput set-prop $i 'Evdev Scrolling Distance' -1 -1 -1
#done

#ids=$(xinput --list | awk -v search="Chicony Wireless Device" \
  #'$0 ~ search {match($0, /id=[0-9]+/);\
  #if (RSTART) \
    #print substr($0, RSTART+3, RLENGTH-3)\
  #}'\
  #)

#for i in $ids
#do
  #echo $i
  #xinput set-prop $i 'Device Accel Constant Deceleration' 2
  ##xinput set-prop $i 'Evdev Scrolling Distance' -1 -1 -1
#done

## to deactivate trackpad : xinput set-prop 11 '133' 0 (11 is device id, 133 is 'Device enabled')

