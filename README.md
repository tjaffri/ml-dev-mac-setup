# Machine Learning Dev Mac Setup
Quick way to consistently set up a new mac with my personal dev preferences for Machine Learning.

> **_Tested most recently on a MacBook Pro (15-inch, 2017), 2.9 GHz Intel Core i7, with Intel HD Graphics 630 and MacOS High Sierra 10.13_**

# 1. Set up OS and Productivity Tools
1. Unbox and admire your shiny new hardware. Go through default OS setup.
2. Launch app store and download all updates (including upgrading to the latest OS version if needed). 
3. Download and install Microsoft Office (or other productivity suite), instructions will vary. Sign in.
4. Clean up dock. Remove extraneous items and pin Terminal, Outlook, etc.

# 2. Set up Dev Tools
See comments in ``setup.sh`` for more information. This is an automated script that installs:

1. [Homebrew](https://brew.sh/)
2. [Git](https://git-scm.com/)
3. [Python 3](https://www.python.org/downloads/)
4. [pipenv](http://pipenv.readthedocs.io/en/latest/)
5. [Tensorflow](https://www.tensorflow.org/) (includes a quick setup validation)
6. [Visual Studio Code](https://code.visualstudio.com/)
7. [Google Chrome](https://www.google.com/chrome/)

To begin setup, launch Terminal and paste in the following:

```bash
bash <(curl -s https://raw.githubusercontent.com/tjaffri/ml-dev-mac-setup/master/setup.sh)
```

> **Note**: Set up is not completely unattended and will break occasionally to ask for credentials etc.

# 3. Configure Visual Studio Code
After setup is complete, Chrome and Visual Studio Code will launch automatically. You can read the docs, set defaults, and pin these to the dock.

To finish setting up Visual Studio Code, follow the instructions here: https://code.visualstudio.com/docs/python/python-tutorial. You can skip the part where you need to install python, code linters or formatters since those were installed already by ``setup.sh``.

Here are some recommended global settings for vscode. You can go to ``File > Preferences > Settings`` or just do ``Ctrl-comma`` to bring up user settings. Paste in the following (make sure you are in user settings, not workspace settings which are project specific overrides):

```
{
  // Controls auto save of dirty files. Accepted values:  'off', 'afterDelay', 'onFocusChange' (editor loses focus), 'onWindowChange' (window loses focus). If set to 'afterDelay', you can configure the delay in 'files.autoSaveDelay'.
  "files.autoSave": "afterDelay",
  // Commit all changes when there are no staged changes.
  "git.enableSmartCommit": true,
   // Arguments passed in. Each argument is a separate item in the array.
  "python.linting.pylintArgs": [
    "--disable=E0401"
  ],
  // Arguments passed in. Each argument is a separate item in the array.
  "python.formatting.autopep8Args": [
    "--max-line-length=120"
  ],
}
```

> **Note**: As you use vscode, if you get error messages stating that pylint (code linter) or autopep8 (code formatter) is not installed, or get other problems related to importing modules make sure you have set the environment in vscode to python3. Look on the bottom left edge of the IDE window to select the environment.

# 4. Configure and Run Python
> **Note:** Official ``pipenv`` support in vscode is a [work in progress](https://github.com/Microsoft/vscode-python/issues/404). After that ships, the following steps will likely get simpler.

### 4.1. Tensorflow
You can enter the tensorflow virtual environment in Terminal at any time by running:

```bash
source ~/tensorflow/bin/activate
```
Use ``pipenv`` to manage dependencies other than tensorflow for individual projects.

### 4.2.	Installing Dependencies (or Starting Fresh)
1. Clone repo locally, then cd into it in a terminal, e.g. bash.
2. Run vscode via ``code .``. Once vscode is running, launch the integrated terminal. Do subsequent operations in the vscode integrated terminal.
3. Run ``pipenv install --dev`` to install all dependencies using ``pipenv``. If you are starting fresh this will init things.
4. Run ``pipenv shell`` to activate the virtual environment in your terminal.
5, If you need to add a new dependency, run ``pipenv install dependency-name`` and it will be added to the Pipfile etc. for this virtual env. If your dependency is dev-time only, run ``pipenv install dependency-name --dev``.

### 4.3. Run
To run a script, first ensure that your pipenv shell is running by typing ``pipenv shell`` in the integrated terminal.

Next, type ``python filename.py`` and the correct version of python plus all the dependencies you installed via pipenv should resolve. A few notes:
1. You might need to explicitly run python3 instead of python if that ends up resolving to python 2. You can run ``python --version`` to see what version it resolving to.
2. If you get errors resolving dependencies make sure you are installing dependencies in your pipenv as discussed above, and also ensure you are running the python installed in the virtualenv. You can run ``where python`` to make sure it is a path inside your virtualenv.

### 4.4. Debug
If you want to use the built-in debugger in vscode, you will find that imported packages are not found if the built-in debugger is using the system python (not the one in your virtual env). To remedy this, you can update your ``launch.json`` to reference the pythonPath in your virtualenv. You can get this path by doing ``where python`` inside your virtualenv (make sure you use the full path, not a relative path).

Since this will be project and machine specific you should make sure you don't commit the launch.json to git.

# 7. Benchmark
``setup.sh`` does basic Tensorflow setup validation. In addition, you can benchmark your setup to make sure it is performing well by running:

```bash
cd ~
source ~/tensorflow/bin/activate
mkdir Source
cd Source
git clone https://github.com/tensorflow/models.git
python models/tutorials/image/mnist/convolutional.py
```

The last line will print out per-step timing. With a CPU-only setup (e.g. a Mac without a tensorflow-supported Nvidia GPU), you should expect ~110ms per step. With a fast GPU setup you should get <10ms per step, a 10X improvement.

> **Note:** As of version 1.2, tensorflow does not support GPU on macOS. For faster performance, you can try training on a linux cluster in the cloud (running inference locally on the mac CPU).

# 8. Update
To update all chocolatey packages, see: https://docs.brew.sh/FAQ.html.

To update all pipenv packages, enter your working directory and then type:

```powershell
pipenv update 
```

Please enjoy responsibly.
