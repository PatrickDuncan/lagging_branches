## Lagging Branches

Every large project experiences an issue where some feature branches end up lagging behind the core development. When a developer starts to develop that feature again they will most likely run into a plethora of conflicts.

One way to avoid this issue is to use this tool! This tool lists every branch that is behind another branch and displays how far behind they are.

### Requirements

- Bash

### Installation

1. Clone this repository
2. Enter your project
3. Run `./<path>/lagging_branches.bash [Options]`

### Options

`lagging_branches.bash [Branch] [Remote] [Fetch]`

#### Branch

The branch to compare all the other branches to.

*Default: master*

#### Remote

The remote name to get the branches from.

*Default: origin*

#### Fetch

Whether you want to the script to fetch the remote (it also prunes). Anything other than the default will fetch.

*Default: no*

### Example

`./<path>/lagging_branches.bash new-users staging yes`
