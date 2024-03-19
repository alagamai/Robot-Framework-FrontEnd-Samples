# Automation test using Robot framework + Selenium

# Screenshots

![Robot-html-report](https://github.com/alagamai/cypress-e2e-testing-complete-framework/blob/main/images/html-report.png 'robot-html-report')


# HOW TO INSTALL ROBOT FRAMEWORK ON A MAC
Follow these steps to set up Robot Framework on your Mac:

Prerequisites:
Visual Studio Code (VSCode):
Download and install Visual Studio Code from here.

Step 1: Install Python
Install Python from the official website: Python Downloads.

Step 2: Install PIP
PIP is a package manager for Python. It is installed by default along with Python. To check the pip version, run the command pip3 -V.

Step 3: Check Path Configuration
Ensure that the paths for Python and PIP are added to the .bash_profile. Open the terminal and run:
vi .bash_profile
If Python was installed through the installer in Step 1, the path should be automatically added. Otherwise, add it manually:
export PATH="/usr/local/bin:$PATH"
source .bash_profile
Verify Python version:
python3 --version

Step 4: Install Robot Framework
Install Robot Framework using PIP:
pip3 install robotframework

Step 5: Install Selenium Library
Install the Selenium Library for Robot Framework:
pip3 install robotframework-seleniumlibrary

Step 6: Download and Install PyCharm IDE (Community Edition)
Download and install PyCharm from the official website: PyCharm Downloads.

Step 7: Set Up PyCharm Project and Interpreter
Create a new project in PyCharm.
Navigate to Settings -> Python Interpreter -> Add Python Interpreter.
Choose either the system interpreter /usr/local/bin/python3.12 or /usr/local/bin/python3.
Install the Hyper RobotFramework Support plugin (Johnny.H) from Settings -> Plugins. This plugin highlights Robot Framework keywords in your scripts.

Step 8: Install ChromeDriver
Download ChromeDriver from here and copy it to /usr/local/bin.
Ensure that ChromeDriver and the Chrome browser have the same version.

# How to Run Your Script
Execute your Robot Framework script using the command:
/usr/local/bin/python3 -m robot.run test.robot
