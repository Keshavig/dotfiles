// The battery_perc component was showing incorrect battery percentage so I made this. Replace BAT0 with your battery stuff
const char BatteryCommand[] = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'";

static const struct arg args[] = {
	/* function 		      format         		    argument */
     { cpu_perc, 		  "^c#89b4fa^ cpu: %s%% | ",      NULL },
	{ ram_perc, 		      "^c#eba0ac^mem: %s%% | ",       NULL },
  	//{ run_command,            "^c#f5c2e7^pkgs: %s | ",        "pacman -Q | wc -l" }, // List # downloaded Packages
  	{ run_command,            "^c#f9e2af^Bat: %s | ",        BatteryCommand }, // Gets battery percentage
  	{ run_command,            "^c#f5c2e7^vol: %s% | ",        "pamixer --get-volume" }, // Make sure pamixer is installed
	{ datetime,                "%s",     		    "^c#a6e3a1^Time: %I:%M %p "}
};
