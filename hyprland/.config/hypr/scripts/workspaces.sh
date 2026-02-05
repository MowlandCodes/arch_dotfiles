# -----------------------------------------------------------------------------
# Hyprland Multi-Monitor Workspace Manager
# 
# Author: Davide Cardillo <cardillo.davide85@gmail.com>
# License: MIT
# Description: Manage and synchronize workspace switching across multiple monitors in Hyprland.
# -----------------------------------------------------------------------------


#!/usr/bin/env bash
set -e


# Get the list of monitors in JSON format using hyprctl
monitors_json=$(hyprctl monitors -j)
# Get the list of workspaces in JSON format using hyprctl
workspaces_json=$(hyprctl workspaces -j)

# Extract the monitor names and IDs from the JSON data
monitors=($(echo $monitors_json | jq -r '. | sort_by(.x) | .[].name'))
# Extract the monitor IDs from the JSON data
ids=($(echo $monitors_json | jq -r '. | sort_by(.x) | .[].id'))

# Extract the workspace IDs from the JSON data
# Actually not used
#workspace_count=$(echo $workspaces_json | jq -r '. | length')
# Extract the active workspace IDs from the JSON data
# Actually not used
#active_workspaces=($(echo $monitors_json | jq -r '. | sort_by(.x) | .[].activeWorkspace.id'))


# brief: Get the current workspace ID for a given monitor
# param: $1 - monitor ID
# return: current workspace ID
# usage: get_current_workspace <monitor_id>
# example: get_current_workspace 1
# returned: 1
function get_current_workspace() {
    # Get the current workspace
    current_workspace=($(hyprctl monitors -j | jq ".[] | select(.id == $1 ) | .activeWorkspace.id"))
    echo $current_workspace
}

# brief: Get the list of workspaces for a given monitor
# param: $1 - monitor ID
# return: list of workspace IDs
# usage: get_list_of_workspaces <monitor_id>
# example: get_list_of_workspaces 1
# returned: 1 2 3
function get_list_of_workspaces() {
    # Get the list of workspaces
    workspaces=($(hyprctl workspaces -j | jq ".[] | select(.monitorID == $1 ) | .id"))
    echo "${workspaces[@]}"
}

# brief: Find the index of a target workspace in an array
# param: $1 - target workspace ID
# param: $@ - array of workspace IDs
# return: index of the target workspace in the array, -1 if not found
# usage: findIndex <target_workspace_id> <workspace_id_1> <workspace_id_2> ...
# example: findIndex 1 1 2 3
# returned: 0
function findIndex() {
    local target=$1
    shift
    local arr=("$@")
    local index=-1 # Default to -1 if not found

    # Find index of current workspace
    for i in "${!arr[@]}"; do
        if [[ "${arr[$i]}" == "$target" ]]; then
            index=$i
            break
        fi
    done

    echo $index
}

# brief: Find the next workspace in the list for a given monitor
# param: $1 - monitor ID
# return: next workspace ID
# usage: findNextWorkspace <monitor_id>
# example: findNextWorkspace 1
# returned: 2
function findNextWorkspace() {
    local monitor=$1
    
    # Get the list of workspaces for the monitor
    local workspaces=($(get_list_of_workspaces ${monitor}))
    # Get the current workspace for the monitor
    local current_workspace=$(get_current_workspace ${monitor})
    # Find the index of the current workspace in the list
    local index=$(findIndex $current_workspace ${workspaces[@]})

    # Check if the current workspace is found in the list
    # If not found, return an empty string
    # and exit with a non-zero status (error)
    # Note: This condition is unlikely to occur.
    if [[ $index -eq -1 ]]; then
        echo ""
        return 1
    else
        # Check if the current workspace is the last one in the list
        if [[ $index -eq $((${#workspaces[@]} - 1)) ]]; then
            # next index out of bounds
            # Set next index to the current index
            local next_index=${index}
        else
            # Set next index to the next workspace in the list
            local next_index=$((index + 1))
        fi
        # Get the next workspace ID from the list
        # and give it. The return status is 0 (success)
        next_workspace=${workspaces[$next_index]}
        echo $next_workspace
        return 0
    fi
}

# brief: Find the previous workspace in the list for a given monitor
# param: $1 - monitor ID
# return: previous workspace ID
# usage: findPreviousWorkspace <monitor_id>
# example: findPreviousWorkspace 1
# returned: 1
function findPreviousWorkspace() {
    local monitor=$1

    # Get the list of workspaces for the monitor
    local workspaces=($(get_list_of_workspaces ${monitor}))
    # Get the current workspace for the monitor
    local current_workspace=$(get_current_workspace ${monitor})
    # Find the index of the current workspace in the list
    local index=$(findIndex $current_workspace ${workspaces[@]})

    # Check if the current workspace is found in the list
    # If not found, return an empty string
    # and exit with a non-zero status (error)
    # Note: This condition is unlikely to occur.
    if [[ $index -eq -1 ]]; then
        echo ""
        return 1
    else
        # Check if the current workspace is the first one in the list
        if [[ $index -eq 0 ]]; then
            # prev index out of bounds
            # Set prev index to the current index
            local prev_index=${index}
        else
            # Set prev index to the previous workspace in the list
            local prev_index=$((index - 1))
        fi
        # Get the previous workspace ID from the list
        # and give it. The return status is 0 (success)
        prev_workspace=${workspaces[$prev_index]}
        echo $prev_workspace
        return 0
    fi
}

# brief: Find the first workspace in the list for a given monitor
# param: $1 - monitor ID
# return: first workspace ID
# usage: findFirstWorkspace <monitor_id>
# example: findFirstWorkspace 1
# returned: 1  
# Note: assuming to have the following workspaces: 1 2 3
function findFirstWorkspace() {
    local monitor=$1
    
    local workspaces=($(get_list_of_workspaces ${monitor}))
    echo ${workspaces[0]}
}

# brief: Find the last workspace in the list for a given monitor
# param: $1 - monitor ID
# return: last workspace ID
# usage: findLastWorkspace <monitor_id>
# example: findLastWorkspace 1
# returned: 3
# Note: assuming to have the following workspaces: 1 2 3
function findLastWorkspace() {
    local monitor=$1
    
    local workspaces=($(get_list_of_workspaces ${monitor}))
    echo ${workspaces[$((${#arr[@]} - 1))]}
}

function moveAllWorkspaces() {
    local direction=$1

    case "${direction}" in
    prev)
        func=findPreviousWorkspace
        ;;
    next)
        func=findNextWorkspace
        ;;
    last)
        func=findLastWorkspace
        ;;
    first)
        func=findFirstWorkspace
        ;;
    *)
        return 1
        ;;
    esac

    # Move all workspaces 
    for m in "${ids[@]}"; do
        echo "Moving workspace $m to ${direction} workspace"
        local workspace=$(${func} $m)
        hyprctl dispatch workspace ${workspace} > /dev/null
    done
}


# brief: Display help message
# usage: cli_help
cli_help() {
    cat <<EOF
Usage: $0 [prev|next|first|last]

Moves simultaneously all workspaces to the previous or next one for all monitors.
This script is intended to be used with Hyprland.

The goal is to replicate the user experience found in KDE or Gnome, where 
workspaces are shared across all monitors and can be switched simultaneously.

Scenario:

    monitor #1             monitor #2
   ______|______          ______|______
   |   |   |   |          |   |   |   |
   1   2   3   4          5   6   7   8      -> workspace ID #

For example, if monitor #1 and monitor #2 are currently on workspace #2 and #6 
respectively, a single command can switch them to workspace #1 and #5, or to #3 and #7.


Options:
  prev: Move all workspaces to the previos workspace
  next: Move all workspaces to the next workspace
  first: Move all workspaces to the first workspace
  last: Move all workspaces to the last workspace
EOF
}


############ Main script execution ############

case "$1" in
    prev)
        moveAllWorkspaces prev
        ;;
    next)
        moveAllWorkspaces next
        ;;
    last)
        moveAllWorkspaces last
        ;;
    first)
        moveAllWorkspaces first
        ;;
    *)
        cli_help
        ;;
esac
