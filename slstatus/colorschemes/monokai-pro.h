const char BatteryCommand[] = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'";

static const struct arg args[] = {
    /* function             format                      argument */
    { cpu_perc,             "^c#ff6188^ cpu: %s%% | ",      NULL },
    { ram_perc,             "^c#9ece6a^mem: %s%% | ",       NULL },
    { run_command,          "^c#1abc9c^Bat: %s | ",         BatteryCommand },
    { run_command,          "^c#ffd866^vol: %s% | ",       "pamixer --get-volume" },
    { datetime,             "%s",                         "^c#ab9df2^Time: %I:%M %p "}
};
