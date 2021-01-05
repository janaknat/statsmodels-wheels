# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    echo "GCC VERSION: "
    gcc --version
}

#function build_wheel {
    # Prevent spurious numpy upgrade by using bdist_wheel
    #build_bdist_wheel $@
#}

function run_tests {

    # Runs tests on installed distribution from an empty directory
    python --version
    # Check OpenBLAS core
    export OPENBLAS_VERBOSE=2
    python -c 'import numpy as np;np.show_config()'
    python -c 'import statsmodels.api as sm; sm.show_versions();'
    python -c 'import statsmodels; statsmodels.test(extra_args=["--durations=20", "-n 2", "--skip-slow", "--skip-examples"], exit=True)'
}
