This repository serves as a fully worked (containerised) example for the installation of the [Lorikeet software package](https://github.com/rhysnewell/Lorikeet) on a Linux system.

If you are simply attempting to install Lorikeet on your own system, you should follow the instructions on the [Lorikeet website](https://rhysnewell.github.io/Lorikeet/installation). 
<!-- Instructions there include for installing Lorikeet via dockerhub, which produces an optimised (and pre-built) image. Use that one if the intention is to use Lorikeet on your data. -->

The repository here is simply intended to show installation in a containerised environment free from the Lorikeet authors' specific computing environment.

To process the example installation, after entering the repository directory, run the following bash script replacing `RELEASE_VERSION` with the version of Lorikeet you wish to install (e.g. 0.8.2):

This will build/download multiple containers and log the output to `*.build.log` files. The build process will take some time, as it involves downloading and compiling a number of dependencies. A small sequence file through each as well to ensure Lorikeet not just installs, but also runs.

```bash
bash compile_and_test_install_methods.bash RELEASE_VERSION
```

The `*.build.log` files created using this process are available in this repository.
