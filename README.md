# About this project

My opinianated windows dev machine setup based and influenced by [microsoft/windows-dev-box-setup-scripts](https://github.com/microsoft/windows-dev-box-setup-scripts)

## Project structure

The script code is organized in a hierarchy

**Scripts**
Responsible Mainly for installing the packages/modules

**Configs**
Configuring windows environment and/or installed items

**Notes:**
The one-click links use the following format. When working out of a different Fork or Branch you'll want to update the links as follows:
`http://boxstarter.org/package/url?https://raw.githubusercontent.com/GITHUB_DOMAIN/windows-dev-box-setup-scripts/YOUR_BRANCH/RECIPE_NAME.ps1`

## Run The script

[Click Me](http://boxstarter.org/package/url?https://raw.githubusercontent.com/ASafwatAli/windows-dev-box-setup-scripts/master/win-dev-box-setup.ps1)

## Notes From [microsoft/windows-dev-box-setup-scripts](https://github.com/microsoft/windows-dev-box-setup-scripts)

**Notes:**

1. If you are using WSL there's a followup step we recommend after running the setup script. When the script finishes you will only have a root user with a blank password. You should manually create a non-root user via `$ sudo adduser [USERNAME] sudo`
   with a non-blank password. Use this user going forward. For more info on WSL please refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).
2. If you're a Node.js contributor working on Node.js core, please see the [Node.js Bootstrapping Guide](https://github.com/nodejs/node/tree/master/tools/bootstrap) or [click here to run](http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/nodejs/node/master/tools/bootstrap/windows_boxstarter).

## Known issues

- The Boxstarter ClickOnce installer does not work when using Chrome. This issue is being tracked [here](https://github.com/chocolatey/boxstarter/issues/345). Please use Edge to run the ClickOnce installer.
- Reboot is not always logging you back in to resume the script. This is being tracked [here](https://github.com/chocolatey/boxstarter/issues/318). The workaround is to login manually and the script will continue running.
- There have been reports of Windows 1803 not successfully launching Boxstarter via the web launcher. See this issue for details: https://github.com/chocolatey/boxstarter/issues/301

## Working with Chocolatey in an organization?

As an organization, you may not be keen to reach out to the internet. That's fine as with just a few modifications you can still take advantage of these scripts. Visit the [organizational use page](ORGANIZATION.md) to learn how.

## Don't have administrative access?

Are you in an environment where you don't have any administrative access on your machine? No problem, you can still take advantage of Chocolatey and manage "portable" software. You can also use a VM where you may have administrative access (see next section).

Unfortunately some of Boxstarter's functionality does require administrative privileges to run, and it will prompt to elevate to administrator if not already elevated.

So while you won't be able to use Boxstarter, take a look at Chocolatey's documentation on [Non-Administrative Install](https://chocolatey.org/install#non-administrative-install). There you will find resources and an example PowerShell script that gives you a quick setup of Chocolatey and installation of a few packages. While not full on Boxstarter, you are still going to get a pretty rapid setup!

**NOTE:**
It's important to point out the open source edition of the Chocolatey client will not allow you to magically install software that requires administrative access, so you will need to find packages that are portable or create those and push them to the community repository or your internal sources.

## Setting up a VM

Windows 10 VM setup instructions

1. Use Hyper-V's [Quick Create](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/quick-create-virtual-machine) to set up a VM
2. Once signed in to your VM, visit this project in a web browser and click one of the script links in the Readme
