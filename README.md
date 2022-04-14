# Dynamic Message Filter

[![CircleCI Build Status](https://circleci.com/gh/danielholdsworth/dynamic-message-filter.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/danielholdsworth/dynamic-message-filter) [![CircleCI Orb Version](https://badges.circleci.com/orbs/danielholdsworth/dynamic-message-filter.svg)](https://circleci.com/orbs/registry/orb/danielholdsworth/dynamic-message-filter) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/danielholdsworth/dynamic-message-filter/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)


A CircleCI Orb that allows you to control setup workflows with your Git commit messages! [Orb-Tools](https://circleci.com/orbs/registry/orb/circleci/orb-tools).

Additional READMEs are available in each directory.

For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).

## How to use

1. Enable [Dynamic Config](https://circleci.com/docs/2.0/dynamic-config/) on your project.
2. Add the [orb](https://circleci.com/developer/orbs/orb/danielholdsworth/dynamic-message-filter) to your config and define the parameters in `mapping`
![carbon (5)](https://user-images.githubusercontent.com/25537601/163356392-06d03e38-9830-4a24-870a-67a7d089cfa5.png)
3. Create a `continue_config.yml` file that then contains workflows triggered if the parameters are `true`
![carbon (4)](https://user-images.githubusercontent.com/25537601/163356412-faa14861-d9e0-4d1b-ae53-4833a7d2c300.png)
4. Ensure the parameters used are set to `false` at the top of the `continue_config.yml` file
5. Trigger a commit and define the parameters in the message i.e. `git commit -m "foo bar [api][e2e]`

![Screenshot 2022-04-14 at 10 29 46](https://user-images.githubusercontent.com/25537601/163356821-37efe1ad-d180-4f4f-834e-6e539e6c3c0c.png)



