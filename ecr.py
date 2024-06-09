import boto3

client = boto3.client('ecr')

repo_name = "cloud-monitoring"
response = client.create_repository(repositoryName=repo_name)


repo_uri = response['repository']['repositoryUri']
print(repo_uri)

