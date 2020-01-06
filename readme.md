lint.bash
=========

`lint.bash` acts as a wrapper for your lint programs. Instead of writing `jsonlint file.json`, `tslint file.ts`, `tern-lint file.js`, or etc; you can execute `lint.bash <FILENAME_BASE.FILENAME_EXT>` for any file type that's supported.


# Supported linters
* jsonlint: `.json`
* tslint: `.ts`
* tern-lint: `.js`
* yamllint: `.yaml, .yml`

# Goals
I would like to add a whole bunch more. Better still, I want to make `lint.bash` extensible such that users could expand support to their liking.
