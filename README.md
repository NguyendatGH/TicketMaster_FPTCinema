Project Setup Guide
To run this project correctly, follow these steps:

1. Create a Configuration File
   Create a file named config.properties and add the following content:

properties
Copy
Edit
sendgrid.api.key=YOUR_API_KEY
This file will store your API key securely.

2. Update context.xml Configuration
   Replace the following fields in your context.xml file:

```{
    <Context path="/Assignment">
    <Resource auth="Container"
              name="jdbc/Assignment"
              driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
              url="jdbc:sqlserver://localhost:1433;databaseName=YOURDATABASE;"
              logAbandoned="true"
              maxActive="100"
              maxIdle="30"
              maxWait="10000"
              username="your_username"
              password="your_password"
              removeAbandoned="true"
              removeAbandonedTimeout="60"
              type="javax.sql.DataSource" />
</Context>
}
####
Replace:

YOURDATABASE → Your actual database name
your_username → Your database username
your_password → Your database password
Now, your project should be properly configured! 🚀
```
