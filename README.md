# DTESET-for-AppImages

An interactive shell script that writes a Desktop Entry for AppImage files.

![DTESET Logo](https://i.imgur.com/oIThoRB.png)

[![BASH script](https://badgen.net/badge/icon/terminal?icon=terminal&label)](https://git.savannah.gnu.org/cgit/bash.git)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://opensource.org/licenses/)
[![GPLv3 License](https://badgen.net/discord/members/murmur?color=blue)](https://discord.gg/murmur/)

## Deployment

I'm aware that some of these instructions are not absolute best-practice, but I'm trying to make this as accessible as possible.

### Without Repository

Navigate to the directory where the AppImage file is located and grab the script using wget:

```bash
wget https://raw.githubusercontent.com/TheLustriVA/DTESET-for-AppImages/main/dteset.sh
```

Make the script executable:

```bash
chmod +x dteset
```

Run the script:

```bash
./dteset SomeProgram.AppImage
```

### With Repository: User-only

Clone the repository:

```bash
git clone git@github.com:TheLustriVA/DTESET-for-AppImages.git
cd DTESET-for-AppImages
```

To make the `dteset` script available for use anywhere in the filesystem for your user, you can place it in a directory that is part of your user's `PATH` environment variable.

Create a `bin` directory in your home directory, if it doesn't already exist:

```bash
mkdir -p ~/bin
```

Move the `dteset` script to the `~/bin` directory:

```bash
mv dteset ~/bin/
```

Ensure that the `~/bin` directory is included in your `PATH`. Open (or create) the `~/.bashrc` file in a text editor:

```bash
nano ~/.bashrc
```

Add the following lines to the end of the file, if they don't already exist:

```bash
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
```

Save and exit the file.

Apply the changes by running:

```bash
source ~/.bashrc
```

Now, you should be able to use the `dteset` command from anywhere in the filesystem:

```bash
dteset SomeProgram.AppImage
```

Remember that this will only work for your user. If you want to make the script available to other users as well, you can place it in a system-wide directory like `/usr/local/bin`. However, this will require administrator privileges.

### With Repository: All Users

Clone the repository as shown in the instructions above.

Move the dteset script to a suitable location, such as /opt. This step is optional, but it helps to keep the script organized and accessible:

```bash
sudo mv dteset /opt/
```

Create a symlink to the dteset script in /usr/local/bin:

```bash
sudo ln -s /opt/dteset /usr/local/bin/dteset
```

Now, the dteset script should be available system-wide, and all users can use the command from anywhere in the filesystem. Since the script is placed in a system-wide location, anyone using it will need to have the right permissions to execute the script.

## License

[GNU GENERAL PUBLIC LICENSE V3](https://choosealicense.com/licenses/gpl-3.0/)

## Related

More command-line helpers

[SHIRT - SHIRT Handles Intense Renaming Tasks](https://github.com/TheLustriVA/shirt_util)
