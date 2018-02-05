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
3. [miniconda3](https://conda.io/miniconda.html) - this includes python 3 by default.
4. [Tensorflow](https://www.tensorflow.org/) (also performs a quick setup validation)
5. [keras](https://keras.io/#installation)
6. [Jupyter](https://jupyter.org)
7. [Visual Studio Code](https://code.visualstudio.com/), with the associated [python extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python), [pylint](https://www.pylint.org), and [autopep8](https://pypi.python.org/pypi/autopep8)
8. [Google Chrome](https://www.google.com/chrome/)

To begin setup, launch Terminal and paste in the following. Set up is not completely unattended and will break occasionally to ask for credentials etc.

```bash
bash <(curl -s https://raw.githubusercontent.com/tjaffri/ml-dev-mac-setup/master/setup.sh)
```

> **Important Note**: After setup is complete, close the Terminal window and open a fresh one to continue.

# 3. Configure Visual Studio Code
After setup is complete, Chrome and Visual Studio Code will launch automatically. You can read the docs, set defaults, and pin these to the dock.

To use python in Visual Studio Code, read the docs here: https://code.visualstudio.com/docs/python/python-tutorial. You can skip the part where you need to install python, code linters or formatters since those were installed already by ``setup.sh``.

Here are some recommended user (global) settings for vscode. You can go to ``File > Preferences > Settings`` or just do ``Command-,`` to bring up user settings. Paste in the following (make sure you are in user settings, not workspace settings which are project specific overrides):

```
{
  // Controls auto save of dirty files. Accepted values:  'off', 'afterDelay', 'onFocusChange' (editor loses focus), 'onWindowChange' (window loses focus). If set to 'afterDelay', you can configure the delay in 'files.autoSaveDelay'.
  "files.autoSave": "afterDelay",
  // Commit all changes when there are no staged changes.
  "git.enableSmartCommit": true,
  // Arguments passed in. Each argument is a separate item in the array.
  "python.formatting.autopep8Args": [
    "--max-line-length=120"
  ],
}
```

> **Note**: As you use vscode, if you get error messages stating that pylint (code linter) or autopep8 (code formatter) is not installed, or get other problems related to importing modules make sure you have set the environment in vscode to python3. Look on the bottom left edge of the IDE to select the environment. If these issues persist, make sure your current conda environment has these packages installed, e.g. type ``conda install pylint`` or ``pip install --upgrade autopep8`` after activating the environment you are using.

# 4. Configure and Run Python
Follow the conda user guide to use python, create and manage environments: https://conda.io/docs/user-guide/overview.html. The following is a condensed summary for common workflows.

### 4.1 Managing Your Environment
Some commonly use packages are installed in the base (global) conda environment (e.g. tensorflow and jupyter). For some standard types of projects you should be able to use that base (global) environment without any changes. The environment should already be active in any bash shell with this standard setup, however if you need to activate it elsewhere just type ``conda activate``.

However, there will some situations where there are packages that you may wish to install for a specific project, which are not available in the global environment (and you don't want to install them in the global environment either, perhaps due to versioning issues).

For such projects with custom package requirements, it is recommended that you create a new conda environment. This is a good practice in general when starting new projects since you never know when a custom package will be required.

```bash
conda create --name project-name --clone base
conda activate project-name
```

Whenever you update your environment, you should save its definition in case somebody else wants to replicate your environment and build your project. Do this by typing:

```bash
conda activate project-name
conda env export > environment.yml
```

Others can then create an environment using your saved ``environment.yml`` file by typing:

```bash
conda env create -f environment.yml
conda activate project-name
```

If you clone a repo that contains an ``environment.yml`` file, you should run the same commadn above to create the environment for that repo locally.

### 4.3. Running
To run a script, first ensure that the appropriate conda environment is active. If you see ``(base) `` as a prefix to your bash shell then you are in the base (global) environment, which should be true for all bash shells. If you want to use another environment, for example to use some custom packages that are not installed in the base environment, make sure you run ``conda activate project-name``.

Next, type ``python filename.py`` and the correct version of python plus all the dependencies you installed into the environment should resolve.

# 7. Benchmark
``setup.sh`` does basic Tensorflow setup validation. In addition, you can benchmark your setup to make sure it is performing well by running:

```bash
cd ~
git clone https://github.com/tensorflow/models.git benchmark
python ./benchmark/tutorials/image/mnist/convolutional.py
```

The last line will print out per-step timing. With a CPU-only setup (e.g. a Mac without a tensorflow-supported Nvidia GPU), you should expect ~115ms per step. With a fast GPU setup you should get ~10ms per step, a ~10X improvement.

> **Note:** As of version 1.2, tensorflow does not support GPU on macOS. For faster performance, you can try training on a linux cluster in the cloud (running inference locally on the mac CPU).

# 8. Update
To update all homebrew packages, see: https://docs.brew.sh/FAQ.html.

To update all base (global) environment conda packages, type:

```bash
conda update conda
conda update --all
```

Please enjoy responsibly.
