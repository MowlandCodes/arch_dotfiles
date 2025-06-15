#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 70

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
// Keep the weather interval >= 30 seconds. Rate Limit issues.... LOL
#define BLOCKS(X)                                          \
    X("", "sb-weather", 30, 5)                             \
    X("^b#C6A0F6^^c#212233^   ^d^ ", "sb-mem", 3, 3)    \
    X("", "sb-volume", 0, 12)                              \
    X("", "sb-battery", 5, 11)                             \
    X("", "sb-net", 2, 13)                                 \
    X("^b#FFBF12^^c#212233^  󰃭  ^d^ ",                  \
      "echo \"^c#FFBF12^$(date '+%b %d, %Y')^d^\"", 60, 1) \
    X("^b#20ACFF^^c#212233^    ^d^ ", "sb-clock", 10, 1)

#endif  // CONFIG_H
