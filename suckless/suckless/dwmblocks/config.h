#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)                                       \
    X("", "sb-weather", 30, 5)                          \
    X("^c#C6A0F6^ ^d^ ", "sb-mem", 10, 3)            \
    X("", "sb-volume", 0, 12)                           \
    X("", "sb-battery", 10, 11)                         \
    X("", "sb-net", 5, 13)                              \
    X("^c#FFBF12^󰃭 ^d^", "date '+%b %d, %Y'", 60, 1) \
    X("^c#20ACFF^ ^d^", "sb-clock", 10, 1)

#endif  // CONFIG_H
