percentage=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
charge_level="${percentage%%[%]*}"
if [[ $((charge_level)) < 15 ]]
then
  swaynag -m "Low battery, please charge now." --background 09090950 --border-bottom AF0000 --button-background 09090950 --button-border-size 2
fi
echo "  $percentage"
