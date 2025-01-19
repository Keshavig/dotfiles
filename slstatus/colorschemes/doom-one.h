// The battery_perc component was showing incorrect battery percentage so I made this. Replace BAT0 with your battery stuff
const char BatteryCommand[] = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'";

static const struct arg args[] = {
	/* function 		      format         		    argument */
    { cpu_perc, 		  "^c#2257A0^ cpu: %s%% | ",      NULL },
	{ ram_perc, 		      "^c#ff5c6b^mem: %s%% | ",       NULL },
  	{ run_command,            "^c#c677dd^Bat: %s | ",        BatteryCommand }, // Gets battery percentage
  	{ run_command,            "^c#da8548^vol: %s% | ",        "pamixer --get-volume" }, // Make sure pamixer is installed
	{ datetime,                "%s",     		    "^c#97be65^Time: %I:%M %p "}
};
