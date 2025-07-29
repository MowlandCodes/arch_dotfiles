#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "  "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 75

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)                     \
    X("", "sb-locale-switcher", 0, 5) \
    X("", "sb-net", 2, 3)             \
    X("", "sb-mem", 3, 1)             \
    X("", "sb-volume", 0, 12)         \
    X("", "sb-battery", 5, 2)         \
    X("", "sb-clock", 5, 2)           \
    X("", "sb-date", 60, 2)
#endif  // CONFIG_H
