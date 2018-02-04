# Install Homebrew (snippet from https://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install git (snippet from https://git-scm.com/book/en/v1/Getting-Started-Installing-Git)
brew install git

# Install miniconda3
brew cask install miniconda
echo ". /usr/local/miniconda3/etc/profile.d/conda.sh" >> ~/.bash_profile
echo "conda activate" >> ~/.bash_profile
source ~/.bash_profile # add conda bins to path for this session 
conda update conda -y # update conda

# Install tensorflow
conda install tensorflow -y

# Install jupyter
conda install jupyter -y

# Install keras
pip install --upgrade keras # not available on conda at the time of writing

# Validate Tensorflow installation per https://www.tensorflow.org/install/install_mac#ValidateYourInstallation
# We need to run a bit of python, using the trick here (with thanks): https://gist.github.com/welbornprod/ccbf43393ecd610032f4
# Retrieve output from Python and put it into a BASH variable.
# This uses a subshell to retrieve whatever python prints out.
function val_from_python {
    # Get a python value from BASH.
    pythonval="$(python3 - <<END
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
END
)"
    if [ "$pythonval" != "b'Hello, TensorFlow!'" ]; then
      echo "Tensorflow Validation failed!"
      exit 1
    else
      echo "Tensorflow Validation successful"
    fi
}
val_from_python

# Install vscode (use this cask https://github.com/caskroom/homebrew-cask/blob/master/Casks/visual-studio-code.rb)
# and related extensions/plugins
brew cask install visual-studio-code
code --install-extension ms-python.python
conda install pylint -y
pip install --upgrade autopep8 # not available on conda at the time of writing

# Launch vscode (makes it easier to pin it to the dock, and you see some docs as well)
code

# Install chrome
brew cask install google-chrome

# Launch Chrome (makes it easier to pin it to the dock and set it as the default browser etc.)
open -a "Google Chrome"
