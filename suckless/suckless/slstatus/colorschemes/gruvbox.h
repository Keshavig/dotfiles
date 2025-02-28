const char BatteryCommand[] = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'";

static const struct arg args[] = {
    { cpu_perc, 		      "^c#fb4934^ cpu: %s%% | ",      NULL },
	{ ram_perc, 		      "^c#b8bb26^mem: %s%% | ",       NULL },
  	{ run_command,            "^c#076678^Bat: %s | ",         BatteryCommand }, // Gets battery percentage
  	{ run_command,            "^c#fe8019^vol: %s% | ",        "pamixer --get-volume" }, // Make sure pamixer is installed
	{ datetime,               "%s",     		              "^c#b16286^Time: %I:%M %p "}
};
