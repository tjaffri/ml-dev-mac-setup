# Machine Learning Dev Mac Setup
Quick way to consistently set up a new mac with my personal dev preferences for Machine Learning.

> **_Tested most recently on a MacBook Pro (15-inch, 2017), 2.9 GHz Intel Core i7, with Intel HD Graphics 630 and MacOS High Sierra 10.13_**

# Set up OS and Productivity Tools
1. Unbox and admire your shiny new hardware. Go through default OS setup.
2. Launch app store and download all updates (including upgrading to the latest OS version if needed). 
3. Download and install Microsoft Office (or other productivity suite), instructions will vary. Sign in.
4. Clean up dock. Remove extraneous items and pin Terminal, Outlook, etc.

# Set up Dev Tools
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

After setup is complete, Chrome and Visual Studio Code will launch automatically. You can read the docs, set defaults, and pin these to the dock.

To finish setting up Visual Studio Code, follow the instructions here: https://code.visualstudio.com/docs/python/python-tutorial. You can skip the part where you need to install python, and simply select the python 3 environment in vscode.

# Use
You can enter the tensorflow virtual environment in Terminal at any time by running:

```bash
source ~/tensorflow/bin/activate
```

# Test
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

# Update
...

Please enjoy responsibly.
