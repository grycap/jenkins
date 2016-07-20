# Containers used in jenkins jobs

## Centos

### 6
* base: Base container with the jenkins user configured
* git: Container with the latest version of Git

#### Container inheritance
* base
  * git
  
___
### 7
* base: Base container with the jenkins user configured and rpm-build libraries
* git: Container with the latest version of Git

#### Container inheritance
* base
  * git
  
---
## Ubuntu

### 14.04
* base: Base container with the jenkins user configured
* git: Container with the latest version of Git
* python: Container with python 2.7 and python test libraries
* im: Container to run the IM service.
* tosca: Container with the python libraries needed to test tosca templates
* clues-indigo: Container used in the clues-indigo testing
* java8: Container with latest version of Java 8
* maven: Container with latest version of Maven
* vnc: Container with VncServer and firefox for headless selenium testing
* ec3: Container with the [ec3](http://servproject.i3m.upv.es/ec3/) software for cluster deployment and testing

#### Container inheritance
* base
  * git
    * python
      * clues-indigo
      * im
      * tosca
    * java8
      * maven
        * vnc
    * ec3
