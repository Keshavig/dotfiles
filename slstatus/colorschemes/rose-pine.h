const char BatteryCommand[] = "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}'";

static const struct arg args[] = {
    /* function             format                      argument */
    { cpu_perc,             "^c#eb6f92^ cpu: %s%% | ",     NULL },  // Rose Pine Gold
    { ram_perc,             "^c#ea9a97^ mem: %s%% | ",      NULL },  // Rose Pine Foam
    //{ run_command,          "^c#da8548^pkgs: %s | ",      "pacman -Q | wc -l" }, // List # downloaded Packages
    { run_command,          "^c#31748f^ Bat: %s | ",        BatteryCommand },  // Rose Pine Highlight
    { run_command,          "^c#f6c177^vol: %s% | ",        "pamixer --get-volume" },  // Rose Pine Gold
    { datetime,             "%s",                         "^c#907aa9^Time: %I:%M %p "}  // Rose Pine Foam
};
