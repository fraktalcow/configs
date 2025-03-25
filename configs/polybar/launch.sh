
#!/usr/bin/env bash




# Get all connected monitors
monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Launch polybar on each monitor
if [[ $(echo "$monitors" | wc -l) -gt 1 ]]; then
    # Multiple monitors
    for m in $monitors; do
        MONITOR=$m polybar --reload main &
        echo "Polybar launched on $m"
    done
else
    # Single monitor
    polybar --reload main &
    echo "Polybar launched on single monitor"
fi
