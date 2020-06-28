# About this project

The goal of this project is to provide a central place to share ideas for streamlining dev box setup and provide sample scripts for common dev scenarios. It's likely you will want to take the scripts here and modify them to fit your particular needs. When you make those changes if you think others would benefit please consider submitting a PR. Before you contribute please see the [Contribution Guidelines](CONTRIBUTING.md).

These scripts leverage two popular open source projects.

- Boxstarter [boxstarter.org](http://boxstarter.org)
- Chocolatey [chocolatey.org](http://chocolatey.org)

Boxstarter is a wrapper for Chocolatey and includes features like managing reboots for you. We're using the Boxstarter web launcher to start the installation process:<br/>
https://boxstarter.org/Learn/WebLauncher

## Project structure

The script code is organized in a hierarchy

**Recipes**
A recipe is the script you run. It calls multiple helper scripts. These currently live in the root of the project (dev_app.ps1, dev_webnodejs.ps1, etc.)

**Helper Scripts**: A helper script performs setup routines that may be useful by many recipes. Recipes call helper scripts (you don't run helper scripts directly). The helper scripts live in the **scripts** folder

## You may want to customize the scripts

These scripts should cover a lot of what you need but will not likely match your personal preferences exactly. In this case please fork the project and change the scripts however you desire. We really appreciate PR's back to this project if you have recommended changes.

_Note: The one-click links use the following format. When working out of a different Fork or Branch you'll want to update the links as follows:_

`http://boxstarter.org/package/url?https://raw.githubusercontent.com/GITHUB_DOMAIN/windows-dev-box-setup-scripts/YOUR_BRANCH/RECIPE_NAME.ps1`

## How to run the scripts

To run a recipe script, click a link in the table below from your target machine. This will download the Boxstarter one-click application, and prompt you for Boxstarter to run with Administrator privileges (which it needs to do its job). Clicking yes in this dialog will cause the recipe to begin. You can then leave the job unattended and come back when it's finished.

| Click link to run                                                                                                                                                              | Description                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_app.ps1'>Full Desktop App</a>                  | Windows Desktop App Development (Visual Studio, Windows SDK, C++, UWP, .NET (WPF and Winforms)) |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_app_desktop_uwp.ps1'>UWP Desktop App</a>       | Windows Desktop App Development (Visual Studio, Windows SDK, UWP)                               |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_app_desktop_.NET.ps1'>.NET Desktop App</a>     | Windows Desktop App Development (Visual Studio, Windows SDK, .NET (WPF and Winforms))           |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_app_desktop_cplusplus.ps1'>C++ Desktop App</a> | Windows Desktop App Development (Visual Studio, Windows SDK, C++)                               |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_web.ps1'>Web</a>                               | Web (VS Code, WSL, Multiple Browsers)                                                           |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_web_nodejs.ps1'>Web NodeJS</a>                 | Web Dev with NodeJS (Web + NodeJS LTS)¹                                                        |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_ml_windows.ps1'>Machine Learning Windows</a>   | Machine Learning with only Windows native tools                                                 |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/dev_ml_wsl.ps1'>Machine Learning Linux</a>         | Machine Learning with Linux tools running on WSL                                                |
| <a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/Microsoft/windows-dev-box-setup-scripts/master/devops_azure.ps1'>DevOps Azure</a>                 | Client setup for DevOps with Azure                                                              |
|                                                                                                                                                                                | Xamarin (Visual Studio, Xamarin, Android SDK)                                                   |
|                                                                                                                                                                                | Containers (Docker, Kubernetes, etc...)                                                         |
|                                                                                                                                                                                | Submit a PR with a recommended configuration!                                                   |

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
