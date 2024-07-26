


# UTube-Backend

### Pre-requisites
* Not lower than Visual Studio 2019
* Microsoft SQL Server Management Studio

### Configuring
Run script.sql in your MsSQL to create new db and tables

Change the ConnectionStrings in appsettings.json. Put in your server name and database that you want to use.

Run in your local machine

# UTube-UI

### Pre-requisites
* Node JS - v18
* Angular CLI - v17
* NPM
* Your favorite text editor

### Configuring
Build first the **UTube-Backend** to get the API base URL

Configure the **UTube-UI** base URL inside the `appsettings.ts`

Use the **UTube-Backend** IP as the `API_ENDPOINT`

### Building
Go to the UTube-UI folder

Run

`npm install`

`ng serve -o`
