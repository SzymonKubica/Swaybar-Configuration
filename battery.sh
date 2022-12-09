percentage=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
state=$(upower -i $(upower -e | grep 'BAT') | grep -E "state" | awk '{print $2}')

charge_level="${percentage%%[%]*}"

if [[ $((charge_level)) < 30 && "$state" != "charging" ]]
then
  swaynag -m "Low battery, please charge now." --background 09090950 --border-bottom AF0000 --button-background 09090950 --button-border-size 2
fi

battery_icon=""

if [[ $((charge_level)) > 90 ]]
then
  battery_icon=""
elif [[ $((charge_level)) > 75 ]]
then
  battery_icon=""
elif [[ $((charge_level)) > 40 ]]
then
  battery_icon=""
elif [[ $((charge_level)) > 15 ]]
then
  battery_icon=""
else
  battery_icon=""
fi

echo "$battery_icon  $percentage"
