const char BatteryCommand[] = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'";

static const struct arg args[] = {
    /* function             format                      argument */
    { cpu_perc,             "^c#f7768e^ cpu: %s%% | ",     NULL },  // Rose Pine Gold
    { ram_perc,             "^c#9ece6a^mem: %s%% | ",      NULL },  // Rose Pine Foam
    //{ run_command,          "^c#da8548^pkgs: %s | ",      "pacman -Q | wc -l" }, // List # downloaded Packages
    { run_command,          "^c#1abc9c^Bat: %s | ",        BatteryCommand },  // Rose Pine Highlight
    { run_command,          "^c#e0af68^vol: %s% | ",        "pamixer --get-volume" },  // Rose Pine Gold
    { datetime,             "%s",                         "^c#bb9af7^Time: %I:%M %p "}  // Rose Pine Foam
};
