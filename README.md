# Machine Learning Dev Mac Setup
Quick way to consistently set up a new mac with my personal dev preferences for Machine Learning.

# Set up OS and Productivity Tools
1. Unbox and admire your shiny new hardware
2. Launch app store and download all updates (including upgrading to the latest OS version). I assume you are running OSX version macOS High Sierra or later. 
3. Download and install Microsoft Office (or other productivity suite)
4. Clean up dock. Remove extraneous items and pin Terminal, Outlook, etc.

# Set up Dev Tools
Launch Terminal and paste in the following:

```bash
bash <(curl -s https://raw.githubusercontent.com/tjaffri/ml-dev-mac-setup/master/setup.sh)
```

> Note: Set up is not completely unattended and will break occasionally to ask for credentials etc.

See comments in ``setup.sh`` for more information on what it is doing. 

# Test
Benchmark per guidance here: https://stackoverflow.com/questions/35703201/speed-benchmark-for-testing-tensorflow-install

# Use
...

Please enjoy responsibly.
