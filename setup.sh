# Install Homebrew (snippet from https://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install git
brew install git

# Install and configure git lfs
brew install git-lfs
git lfs install --skip-smudge

# Install node and npm
brew install node

# Install docker
brew install docker --cask

# Install ngrok
brew install ngrok --cask

# Install wget
brew install wget

# Install sshfs
brew install osxfuse --cask
brew install sshfs

# Install miniconda3
brew install miniconda --cask
echo ". /usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" >> ~/.bash_profile
echo "conda activate" >> ~/.bash_profile
echo "alias pyclean='find . -name \"*.py[c|o]\" -o -name __pycache__ -exec rm -rf {} +'" >> ~/.bash_profile
source ~/.bash_profile # add conda bins to path for this session 
conda update conda -y # update conda
python -m pip install --upgrade pip # update pip

# Install tensorflow
conda install -c conda-forge tensorflow -y

# Install jupyter
conda install jupyter -y

# Install keras
conda install keras -y

# Install matplotlib
conda install matplotlib -y

# Validate Tensorflow installation per https://www.tensorflow.org/install/install_mac#ValidateYourInstallation
# We need to run a bit of python, using the trick here (with thanks): https://gist.github.com/welbornprod/ccbf43393ecd610032f4
# Retrieve output from Python and put it into a BASH variable.
# This uses a subshell to retrieve whatever python prints out.
function val_from_python {
    # Get a python value from BASH.
    pythonval="$(python3 - <<END
import tensorflow as tf
tf.compat.v1.disable_eager_execution()
hello = tf.constant('Hello, TensorFlow!')
sess = tf.compat.v1.Session()
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
brew install visual-studio-code --cask
code --install-extension ms-python.python
conda install pylint -y
pip install --upgrade autopep8 # not available on conda at the time of writing
code --install-extension dbaeumer.vscode-eslint
code --install-extension EditorConfig.editorconfig
code --install-extension PeterJausovec.vscode-docker
code --install-extension GrapeCity.gc-excelviewer
code --install-extension dotjoshjohnson.xml
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension bradgashler.htmltagwrap
code --install-extension ms-vscode.csharp

# Launch vscode (makes it easier to pin it to the dock, and you see some docs as well)
code

# Install chrome
brew install google-chrome --cask

# Launch Chrome (makes it easier to pin it to the dock and set it as the default browser etc.)
open -a "Google Chrome"
