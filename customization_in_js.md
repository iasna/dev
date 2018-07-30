# Extensibility in JS
Table of Contents
- [Introduction](#introduction)
  * [Pre-requisites](#Pre-requisites)
  * [NodeJS Installation](#installation)
- [NodeJS Modules Overview](#Nodejs-modules-overview)

    + [local_modules](###local_modules)
    + [API Server](#api-server)
      * [Flow Diagram](#APIServer-flow)
      * [Folder Structure](####folder-structure)
      * [Installation](####installation)
    + [Transaction Processing](#transaction-processing)
      * [Flow Diagram](#transaction-flow)
      * [Folder Structure](###folder-structure)
      * [Installation](####installation)
    + [Rest Client](#Rest-Client)
      * [Flow Diagram]
      * [Folder Structure](###folder-structure)
      * [Installation](####installation)

- [local_modules](#local_modules) 
  * [Using Logger](#using-logger)
  * [Executing Database Queries](#executing-database-queries)
  * [Using C++ entities native module](#using-c++-entities-native-module)  

- [Extending APIs](#Extending-APIs)
  + [Writing resource controller](#Writing-resource-controller)
  + [Attaching resource controller to application](#Attaching-resource-controller-to-application)
  + [Error Handling](#error-handling)
 
- [Extending Transaction](#extending-transaction)
  * [Using and customizing entities](#using-and-customizing-entities)
  * [Transaction custom code](#transaction-custom-code)
  * [Attaching custom transaction js to application](#Attaching-custom-transaction-js-to-application)

- [Extending Translator for REST Client ](#extending-translator-for-rest-client)
  * [Translator custom code](#translator-custom-code)
  
# Introduction
IRIS Core provides extensibility which is a very prominent & useful feature i.e. writing owns implementation of transaction or translation over a base functionality. Those who have been doing it in C++ must be quiet aware of it. From IRIS 5.4.0 onwards customization can not only be done in C++ but those who know JS can take full advantage of it and write their implementation in JS. 

To support this a new framework was developed and integrated with the product. 
## Pre-requisites
* Understanding of extensibility in C++
* Familiarity with JS & TypeScript
* NodeJS v8.11.3
* typescript 
* node-gyp

## NodeJS Installation
NodeJS can be installed using : 

* Package Manager 

  Follow this link for details 
https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora

* From source

  Follow this link for details
https://github.com/nodejs/node/blob/master/BUILDING.md#building-nodejs-on-supported-platforms

To verify check 
node --version 
& 
npm --version

Now install typescript and node-gyp

npm install -g typescript
npm install -g node-gyp

## NodeJS Modules Overview
The framework changes involved developing APIServer, RestClient,  Transaction Processing modules and local_modules for the purpose of logging and db connectivity. This section  will highlight main features of these modules 
### local_modules
Local modules contains following features 
* Logger
* Database connectivity
* C++ native addon build

### API Server
API Server is a server running on a certain port and entertaining all kinds of request from client. This server communicates with the IRIS Core for the completion of the request and takes the corresponding response from IRIS Core. Here you can write controllers to change the request received from client before sending to IRIS Core similarly response received from IRIS Core can also be changed before sending reply back to client. Later sections will cover the details.

![APIServer flow](images/apiserver.png)

#### Folder Structure 
#### Installing APIServer

```
npm install 
```
Running APIServer

``` node APIServer/index.js <> <> ```

### Transaction processing
In IRIS transactions can be customized in C++ by writing a class and overriding few methods. A class then is compiled into a shared object which is loaded once and executed whenever this certain flavor of transaction is received. For doing this in javascript a generic transaction class is written in C++ customjs.cpp which is to be exectued whenever you want to write your transaction logic is javascript.  A Transaction processing server is created. customjs shared object executes and sends  a transaction to transaction processing server. It then executes that particular transaction js where all the business logic is written and sends the response to IRIS Core customjs. Similar flow is followed in case of response too. Later sections will cover the details.

![Transaction flow](images/transaction.png)

#### Folder Structure
#### Installing Transaction Processing

```
npm install 
```
Running APIServer

``` node APIServer/index.js <> <> ```


## Rest Client
TODO: SAAD SIDDIQUI


# local_modules
## Using Logger
TODO : SAAD SIDDIQUI

## Executing Database Queries 
TODO : Asna Ishrat

## Using C++ entities native module
TODO : Asna Ishrat

# Extending APIs
## Writing resource controller
TODO : SAAD Siddiqui
## Error Handling
TODO : Sabih
## Attaching resource controller to application

TODO: Asna
# Extending Transactions
## Using & customizing entities
## Transaction custom code
## Attaching custom transaction js to application

# Extending Translator for REST Client