import os, time, sys, boto3

# Copy files based on set amount of day(s) old up to S3 bucket using shared credentials(.aws/credentials)

session = boto3.Session(profile_name = "account_name")
s3 = session.client('s3')
s3_bucket = 'your_bucket'

def mvFiles(dir, age):
    for f in os.listdir(dir):
        now = time.time()
        file_path = os.path.join(dir, f)
        modified = os.stat(file_path).st_mtime
        if modified < now - age:
            if os.path.isfile(file_path):
                data = open(file_path, 'rb')
                s3.put_object(Bucket = s3_bucket, Key = f, Body = data)


mvFiles('path/to/files', (7 * 86400)) 

