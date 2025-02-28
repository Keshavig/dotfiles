const char BatteryCommand[] = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'";

static const struct arg args[] = {
    /* function             format                      argument */
    { cpu_perc,             "^c#ff5555^ cpu: %s%% | ",      NULL },
    { ram_perc,             "^c#50fa7b^mem: %s%% | ",       NULL },
    { run_command,          "^c#8be9fd^Bat: %s | ",         BatteryCommand },
    { run_command,          "^c#fafa8c^vol: %s% | ",       "pamixer --get-volume" },
    { datetime,             "%s",                           "^c#bd93f9^Time: %I:%M %p "}
};
