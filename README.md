Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### How to host the data processing in to Bigquery project
- Navigate to the file `profiles.yml`
- Take a look at environment variables specified in profiles
- For development, navigate to `.barsch.sh` (for Linux) or `.zprofile` (for Mac) to add values for the variables in `outputs` `dev`
- For production, perform the same action for the variables  in `outputs` `prod`
