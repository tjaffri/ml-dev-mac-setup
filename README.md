# Machine Learning Dev Mac Setup
Quick way to consistently set up a new mac with my personal dev preferences for Machine Learning.

> **_Tested most recently on a MacBook Pro (15-inch, 2017), 2.9 GHz Intel Core i7, with Intel HD Graphics 630_**

# Set up OS and Productivity Tools
1. Unbox and admire your shiny new hardware
2. Launch app store and download all updates (including upgrading to the latest OS version). 
3. Download and install Microsoft Office (or other productivity suite), instructions will vary.
4. Clean up dock. Remove extraneous items and pin Terminal, Outlook, etc.

# Set up Dev Tools
See comments in ``setup.sh`` for more information.

Launch Terminal and paste in the following:

```bash
bash <(curl -s https://raw.githubusercontent.com/tjaffri/ml-dev-mac-setup/master/setup.sh)
```

> **Note**: Set up is not completely unattended and will break occasionally to ask for credentials etc.

After setup is complete, pin Chrome and Visual Studio Code to the dock.

# Test
Benchmark your setup:

```bash
source ~/tensorflow/bin/activate
mkdir Source
cd Source
git clone https://github.com/tensorflow/models.git
python models/tutorials/image/mnist/convolutional.py
```

The last line will print out per-step timing. With a CPU-only setup (e.g. a Mac without a tensorflow-supported Nvidia GPU), you should expect ~110ms per step. With a fast GPU setup you should get <10ms per step.

# Use
...

Please enjoy responsibly.
