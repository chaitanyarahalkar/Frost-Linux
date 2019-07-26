# Frost OS 


![Frost Logo](frost-128px.png)

A Linux based Operating System for Developers.

## Table of Contents
1. What is Frost OS?
2. Why Frost OS?
3. Applications and Features
4. Building
5. Contributing to Frost
6. Copyrights and Licensing


### What is Frost OS? 

Frost OS is a Linux based operating system. More specifically, it is based on Arch Linux. Frost OS is currently in early stages of development and is being tested continuously. Frost OS is designed specifically for enginners and developers everywhere. It comes prebundled with software tools and packages which are prominent among developers everywhere. It's just ready to use out of the box. It has a huge list of rich software created by the FOSS community. 

Frost OS can be used either directly from a CD/DVD or a USB in live mode or by installing it to a hard drive. An installer comes pre-bundled to guide you through the installation process. 

### Why Frost OS? 

Frost OS has a compilation of toolsets and softwares used by developers and engineers everywhere. Frost OS can be used in the live mode or 
Frost OS comes with an elegant and rich UI with support for dark mode. 


#### Privacy & Security 

Your privacy is our concern. All the applications pre-installed are checked for privacy violations before considering. Any data sent over is through an anonymous channel for diagnostic purposes. 
Frost OS is highly skeptic about security. It uses a custom built & stable Linux kernel enhanced for security. It uses Linux-Hardened, a Linux kernel implementation providing an overlay of security.

- Userspace ASLR comparison: Linux-Hardened provides an improved implementation of Address Space Layout Randomization for userspace processes. 
- Restriced access to kernel logs: Kernel logs contain critical information which may prove useful to an exploiter. The kernel ensures limited access to these logs, ensuring that sensitive information is not leaked.
- Restricting module loading: This feature ensures that only signed (with a valid key) kernel modules are loaded into the kernel.
- Restricting access to kernel pointers in the proc filesystem
- Limited Ptrace scope: It prevents processes from performing a ptrace call on other processes outside of their scope without CAP_SYS_PTRACE. While many debugging tools require this for some of their functionality, it is a significant improvement in security. Without this feature, there is essentially no separation between processes running as the same user without applying extra layers like namespaces. The ability to attach a debugger to an existing process is a demonstration of this weakness.
- PIDs of other users' processes remain hidden

The hardened kernel comes with Openwall's [Linux Kernel Runtime Guard](https://www.openwall.com/lkrg). It is a [loadable kernel module](https://en.wikipedia.org/wiki/Loadable_kernel_module) that performs runtime integrity checking of the Linux kernel and detection of security vulnerability exploits against the kernel.

Sandbox your applications with [Firejail](https://firejail.wordpress.com) which is a SUID program that reduces the risk of security breaches by restricting the running environment of untrusted applications using [Linux namespaces](https://en.wikipedia.org/wiki/Linux_namespaces) and [seccomp-bpf](https://en.wikipedia.org/wiki/Seccomp).

#### Pacman - A Powerful Package Manager

Frost OS is built on Arch Linux. It inherits its most powerful feature, the package manager - Pacman. It ensures that your packages and their dependencies are managed with breeze. Pacman gives complete control over which packages to download, which dependencies to remove/install and keeps all the softwares up-to-date. Pacman can be configured to choose download mirrors as per your choice. Pacman provides access to millions of packages built by developers and the community. Check [here](https://aur.archlinux.org) for more information. 

#### The Power of Customisation 

Frost OS has powerful customisation options. You can build the entire system from scratch, choosing from the millions of packages on the Pacman store of repositories. From choosing your bootloader to the desktop enviroment and softwares, Frost OS is completely in your hands.  
