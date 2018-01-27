# Install Homebrew (snippet from https://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install git (snippet from https://git-scm.com/book/en/v1/Getting-Started-Installing-Git)
brew install git

# Install python 3 (system likely already has 2.x)
brew install python3

# Install Tensorflow with virtualenv (instructions at https://www.tensorflow.org/install/install_mac)
sudo easy_install pip
pip3 install --upgrade virtualenv
virtualenv --system-site-packages -p python3 tensorflow # for Python 3.n
source ~/tensorflow/bin/activate
easy_install -U pip
pip3 install --upgrade tensorflow

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

# Install pipenv
pip3 install --user pipenv
echo 'export PATH=~/Library/Python/3.6/bin:$PATH' >>~/.bash_profile

# Install vscode (use this cask https://github.com/caskroom/homebrew-cask/blob/master/Casks/visual-studio-code.rb)
brew cask install visual-studio-code

# Launch vscode (makes it easier to pin it to the dock, and you see some docs as well)
code

# Install chrome (use this cask )
brew cask install google-chrome

# Launch Chrome (makes it easier to pin it to the dock and set it as the default browser etc.)
open -a "Google Chrome"
