# Materialize Starter Project

This is a [dbt](https://www.getdbt.com) project for managing Materialize.

> [!NOTE]  
> On first setup of this repository, fill in the host parameter in [profiles.yml](profiles.yml) found in the Materialize console. 

## Dev setup

0. Log in to your `Materialize` environment and set up an app password for your account at https://console.materialize.com/access

1. To run locally you'll need to store your username and app password in your environment.

   The app password you received from the console should be set as `DBT_PASSWORD`:

   ```shell
   export DBT_PASSWORD="<YOUR APP PASSWORD>"
   ```

   Your username should be set as `MZ_USER`
   
   E.g. if your email is seth@email.com:
   ```shell
   export MZ_USER=seth@email.com
   ```


2. You'll need a recent version of Python and PostgreSQL. On macOS,
   install Homebrew if you haven't already, then run:

   ```shell
   brew install python postgresql
   ```

   This setup also requires [poetry](https://python-poetry.org/) for dependency
   management. You can install poetry from [their website](https://python-poetry.org/docs/#installation).

2. Install dbt dependencies by running:

   ```shell
   bin/dbt deps
   ```

3. Test the connection by running:

   ```shell
   bin/dbt debug
   ```

4. Deploy a personal copy of the dbt models by running:

   ```shell
   bin/dbt run
   ```

   This will create models in the `Materialize` account under a schema named `dbt_$DBT_USER` in the `materialize` database

5. Clean up after yourself using

    ```shell
    bin/dbt run-operation drop_target_schema
    ```
